{ config, lib, inputs, pkgs, ... }:

{
  boot.loader.limine.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.limine.maxGenerations = 6;
  boot.loader.limine.extraEntries = ''
    /Windows
      protocol: efi
      path: uuid(6f16bff5-058e-486f-a0a4-a4cf4e279be4):/EFI/Microsoft/Boot/bootmgfw.efi
  '';

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