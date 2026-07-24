{ config, pkgs, inputs, ... }:

{
  services.arrpc.enable = true;
  services.kdeconnect.enable = true;
}