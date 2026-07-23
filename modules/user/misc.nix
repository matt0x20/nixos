{ config, pkgs, inputs, ... }:

{
  programs.home-manager.enable = true;
  services.arrpc.enable = true;
  services.kdeconnect.enable = true;
}