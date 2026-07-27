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
      logo = pkgs.fetchurl {
        url = "https://nixos.org/logo/nixos-hires.png";
        sha256 = "1ivzgd7iz0i06y36p8m5w48fd8pjqwxhdaavc0pxs7w1g7mcy5si";
      };
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
}