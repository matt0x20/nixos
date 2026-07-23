{ config, lib, inputs, pkgs, ... }:

{
  services.displayManager.ly.enable = true;
  services.xserver.xkb.layout = "pl";
  services.printing.enable = true;
  services.flatpak.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.hardware.openrgb.enable = true;
}