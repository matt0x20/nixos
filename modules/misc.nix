{ config, lib, inputs, pkgs, ... }:

{
  environment.etc."/xdg/menus/applications.menu".text = builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
  environment.pathsToLink = [ "/share" ];

  xdg.mime.enable = true;
  xdg.menus.enable = true;
}