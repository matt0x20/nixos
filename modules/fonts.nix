{ config, lib, inputs, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    adwaita-fonts
    jetbrains-mono
    rubik
    nerd-fonts.ubuntu
    nerd-fonts.jetbrains-mono
  ];
}