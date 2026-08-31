{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
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
    lmstudio
    discord-ptb
    (pkgs.blender.override { cudaSupport = true; })
    inputs.helium.packages.${system}.default
    prismlauncher
    anydesk
    inputs.caelestia-shell.packages.${pkgs.stdenv.hostPlatform.system}.with-cli
  ];

  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio.override {cudaSupport = true;};
  }; 

  programs.home-manager.enable = true;
}