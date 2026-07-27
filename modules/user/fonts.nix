{ config, pkgs, inputs, ... }:

{
  home.file.".local/share/fonts/google-sans".source = ../../fonts/google-sans;
  home.file.".local/share/fonts/google-sans-flex".source = ../../fonts/google-sans-flex;
  home.file.".local/share/fonts/google-sans-flex-rounded".source = ../../fonts/google-sans-rounded;

  fonts.fontconfig.defaultFonts = {
    sansSerif = [ "Google Sans Flex Rounded" "Noto Sans CJK JP" ];
    serif = [ "Noto Serif CJK JP" "DejaVu Serif" ];
    # monospace = [ "Noto Sans Mono CJK JP" "JetBrains Mono" ];
  };
}