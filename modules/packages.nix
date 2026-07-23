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
    lxqt.pavucontrol-qt
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
    nautilus
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
    nemo
  ];
}