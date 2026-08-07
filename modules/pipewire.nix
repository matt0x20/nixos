{ config, lib, inputs, pkgs, ... }:

{
  security.rtkit.enable = true; # allows for lower latency

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.pipewire.wireplumber.extraConfig."51-disable-ducking" = {
    "wireplumber.settings" = {
      "node.stream.ducking" = false;
    };
  };
}