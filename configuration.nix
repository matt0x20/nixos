{ config, lib, inputs, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/nix-ld.nix
      ./modules/misc.nix
      ./modules/networking.nix
      ./modules/nvidia.nix
      ./modules/pipewire.nix
      ./modules/programs.nix
      ./modules/services.nix
      ./modules/polkit.nix
      ./modules/packages.nix
      ./modules/fonts.nix
      ./modules/bootloader.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Europe/Warsaw";

  users.users.matt = {
    isNormalUser = true;
    description = "Matt";
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.fish;
  };

  xdg.portal = {
    enable = true;
  
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  system.stateVersion = "26.05"; # DON'T TOUCH THIS

}

