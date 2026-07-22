{ config, pkgs, ... }:

{
  imports = [
    ./modules/noctalia.nix
  ];

  home.username = "matt";
  home.homeDirectory = "/home/matt";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    
  ];

  programs.home-manager.enable = true;

  home.file.".config/hypr".source = ./dotfiles/hypr;
}
