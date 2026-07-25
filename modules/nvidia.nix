{ config, lib, inputs, pkgs, ... }:

{
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia-container-toolkit.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    nvidiaPersistenced = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.sessionVariables = {
    __GL_SYNC_TO_VBLANK = "0";
  };

  systemd.services.nvidia-gpu-lock = {
    description = "Lock NVIDIA GPU Core and Memory Clocks";
    wantedBy = [ "multi-user.target" ];

    # Ensure the service runs after the NVIDIA driver is active
    after = [ "display-manager.service" "nvidia-persistenced.service" ];
    wants = [ "nvidia-persistenced.service" ];

    # Inject the nvidia driver package binaries into this service's $PATH
    path = [ 
      config.hardware.nvidia.package 
      config.hardware.nvidia.package.bin # Required for certain NixOS driver configurations
    ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      User = "root";
    };

    # Since 'path' provides the binary, you can call nvidia-smi directly
    script = ''
      nvidia-smi -lgc 2100,2130
    '';
  };
}