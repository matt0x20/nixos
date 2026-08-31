{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/user/packages.nix
    ./modules/user/env.nix
    ./modules/user/gtk.nix
    ./modules/user/services.nix
    ./modules/user/sources.nix
    ./modules/user/zen.nix
    ./modules/user/fonts.nix
    ./modules/user/caelestia.nix
  ];

  home.username = "matt";
  home.homeDirectory = "/home/matt";

  home.stateVersion = "26.05";
}
