{ config, lib, inputs, pkgs, ... }:

{
  boot.loader.limine.enable = false;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.systemd-boot.configurationLimit = 6;

  boot = {
    plymouth = {
      enable = true;
      theme = "spinner";
      logo = pkgs.runCommand "logo.png" {} ''
        cp ${pkgs.nixos-icons}/share/icons/hicolor/48x48/apps/nix-snowflake-white.png $out
      '';
    };

    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
      "nvidia.NVreg_EnableGpuFirmware=0"
    ];

    loader.timeout = 0;
  };

  boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
}