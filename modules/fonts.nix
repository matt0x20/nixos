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
  ];

  fontconfig.defaultFonts = {
    sansSerif = [ "Noto Sans CJK JP" "Adwaita Sans" ];
    serif = [ "Noto Serif CJK JP" "DejaVu Serif" ];
    monospace = [ "Noto Sans Mono CJK JP" "Adwaita Mono" ];
  };
}