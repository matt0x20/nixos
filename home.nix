{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/user/noctalia.nix
    ./modules/user/packages.nix
    ./modules/user/env.nix
    ./modules/user/gtk.nix
    ./modules/user/misc.nix
    ./modules/user/sources.nix
    ./modules/user/matugen.nix
  ];

  home.username = "matt";
  home.homeDirectory = "/home/matt";

  home.stateVersion = "26.05";
}
