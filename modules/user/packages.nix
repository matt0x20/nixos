 config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
   discord
   gparted
   pywalfox-native
   inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
   fetch
   gearlever
   ddcutil
   arrpc
   equibop
  ];
}