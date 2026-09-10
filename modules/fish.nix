{ config, lib, inputs, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      alias nhs="nh os switch"
      alias nhb="nh os build"
      alias nfu="nix flake update"
      alias ..='cd ..'
      alias ...='cd ../..'
      alias ....='cd ../../..'
      alias .....='cd ../../../..'
      alias ......='cd ../../../../..'
    '';
  };
}