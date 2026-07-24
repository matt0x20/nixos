{ config, lib, inputs, pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    
    config = {
      hyprland = {
        default = [
          "hyprland"
          "kde"
        ];
      };
    };
  
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      kdePackages.xdg-desktop-portal-kde
    ];

    config.common.default = [ "kde" ];
  };
}