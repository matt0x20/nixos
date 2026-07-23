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
}