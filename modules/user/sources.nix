{ config, pkgs, inputs, ... }:

{
  home.file.".icons".source = ../../.icons;
  home.file.".config/hypr".source = ../../.config/hypr;
  # home.file.".config/noctalia".source = ../../.config/noctalia;
  home.file.".config/kdeglobals".source = ../../.config/kdeglobals;
  home.file.".config/dolphinrc".source = ../../.config/dolphinrc;
  home.file.".config/kitty/kitty.conf".source = ../../.config/kitty/kitty.conf;
  home.file.".config/kitty/scroll_mark.py".source = ../../.config/kitty/scroll_mark.py;
  home.file.".config/kitty/search.py".source = ../../.config/kitty/search.py;
  home.file.".config/matugen".source = ../../.config/matugen;
}