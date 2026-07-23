{ config, pkgs, inputs, ... }:

{
  home.sessionPath = [
    "/run/current-system/sw/bin"
  ];

  home.sessionVariables = {
    XCURSOR_THEME = "macOS";
    XCURSOR_SIZE = "24";
  };
}