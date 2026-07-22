{ config, pkgs, ... }:

{
  imports = [
    ./modules/noctalia.nix
  ];

  home.username = "matt";
  home.homeDirectory = "/home/matt";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
   discord
   gparted
  ];

  programs.home-manager.enable = true;

  home.file.".config/hypr".source = ./.config/hypr;
  home.file.".config/noctalia".source = ./.config/noctalia;

  home.sessionPath = [
    "/run/current-system/sw/bin"
  ];

  dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };

    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome.gnome-themes-extra;
      };
    };

    # Wayland, X, etc. support for session vars
    systemd.user.sessionVariables = config.home-manager.users.matt.home.sessionVariables;
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };
}
