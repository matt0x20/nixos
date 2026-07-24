{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
   discord
   gparted
   pywalfox-native
   fetch
   gearlever
   ddcutil
   arrpc
   equibop
  ];

  programs.home-manager.enable = true;
}