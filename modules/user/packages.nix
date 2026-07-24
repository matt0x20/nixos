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
   davinci-resolve-studio
  ];

  programs.home-manager.enable = true;
}