{ config, pkgs, inputs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "/mnt/OV1/music/";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
    '';
  
    network.startWhenNeeded = true;
  };
}