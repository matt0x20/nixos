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
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}