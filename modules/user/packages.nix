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

    (pkgs.anki.withAddons [
      pkgs.ankiAddons.review-heatmap
    ])
  ];

  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio.override {cudaSupport = true;};
  }; 

  programs.home-manager.enable = true;
}