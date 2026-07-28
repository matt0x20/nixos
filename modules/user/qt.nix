{ config, pkgs, inputs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
  };
}