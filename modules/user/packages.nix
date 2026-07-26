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
   anki-bin
   alsa-scarlett-gui
   cider-2
  ];

   programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio.override {cudaSupport = true;};
  }; 

  programs.home-manager.enable = true;
}