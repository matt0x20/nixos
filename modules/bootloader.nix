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
      theme = "rings";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };

    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];

    loader.timeout = 0;
  };
}