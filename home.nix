{ config, pkgs, inputs, ... }:

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
   inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
   fetch
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
      name = "macOS";
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

  home.sessionVariables = {
    XCURSOR_THEME = "macOS";
    XCURSOR_SIZE = "24";
  };

  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
  };
}
