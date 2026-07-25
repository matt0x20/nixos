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

    after = [ "display-manager.service" "nvidia-persistenced.service" ];
    wants = [ "nvidia-persistenced.service" ];

    path = [ 
      config.hardware.nvidia.package 
      config.hardware.nvidia.package.bin
    ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      User = "root";
    };

    script = ''
      nvidia-smi -lgc 2100,2130
    '';
  };
}