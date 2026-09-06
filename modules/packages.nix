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
    (python3.withPackages (p: [ p.numpy p.requests p.pip p.cryptography p.pyqt6 ]))
    wineWow64Packages.stable
    wineWow64Packages.staging
    winetricks
    wineWow64Packages.waylandFull
    distrobox
    mpv
    kdePackages.kservice
    kdePackages.kio
    kdePackages.kdf
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.kio-admin
    kdePackages.kio-gdrive
    kdePackages.qtwayland
    kdePackages.plasma-integration
    kdePackages.kdegraphics-thumbnailers
    kdePackages.breeze-icons
    kdePackages.gwenview
    kdePackages.kimageformats
    kdePackages.ark
    qt6.qtimageformats
    libraw
    shared-mime-info
    shared-mime-info
    desktop-file-utils
    fuse
    jq
    ocl-icd
    papirus-icon-theme
    p7zip
    i2c-tools
    openrgb
    android-tools
    dotnet-sdk
    playerctl
    killall
    libnotify
    ffmpeg
  ];

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      # dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  virtualisation.docker.enable = true;
  virtualisation.oci-containers.backend = "docker";

  users.users.matt = {
    extraGroups = [
      "podman"
    ];
  };

  programs.gamescope = {
    enable = true;
    enableWsi = true;
  };  

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/etc/nixos";
  };

  programs.nautilus-open-any-terminal.enable = true;
  programs.steam.enable = true;
  programs.firefox.enable = true;
  programs.hyprland.enable = true;
  services.hardware.openrgb.enable = true;
  services.geoclue2.enable = true;  # For QtPositioning
  services.networkmanager.enable = true;  # For network management
}