{ config, lib, inputs, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    neovim
    git
    fastfetch
    kitty
    vscodium
    btop
    pavucontrol
    kdePackages.dolphin
    polkit_gnome
    kdePackages.kdesu
    appimage-run
    nwg-look
    adw-gtk3
    kdePackages.qt6ct
    libsForQt5.qt5ct
    hyprcursor
    xcur2png
    kdePackages.qtsvg
    kdePackages.kdegraphics-thumbnailers 
    kdePackages.breeze-icons
    kdePackages.breeze
    darkly
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    exfatprogs
    ntfs3g
    btrfs-progs
    gnome-disk-utility
    gtk3
    unzip
    unrar
    (python3.withPackages (p: [ p.numpy p.requests p.pip p.cryptography ]))
    wineWow64Packages.stable
    wineWow64Packages.staging
    winetricks
    wineWow64Packages.waylandFull
    openrgb
    distrobox
    mpv
    kdePackages.kservice
  ];

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  users.users.matt = {
    extraGroups = [
      "podman"
    ];
  };

  programs.nautilus-open-any-terminal.enable = true;
  programs.steam.enable = true;
  programs.firefox.enable = true;
  programs.hyprland.enable = true;
}