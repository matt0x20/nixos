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
   pywalfox-native
  ];

  programs.home-manager.enable = true;

  home.file.".icons".source = ./.icons;
  home.file.".config/hypr".source = ./.config/hypr;
  home.file.".config/noctalia".source = ./.config/noctalia;
  home.file.".config/kdeglobals".source = ./.config/kdeglobals;
  home.file.".config/dolphinrc".source = ./.config/dolphinrc;

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
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 24;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
  };
}
