{ config, pkgs, inputs, ... }:

{
  home.file.".local/share/fonts/google-sans".source = ../../fonts/google-sans;
  home.file.".local/share/fonts/google-sans-flex".source = ../../fonts/google-sans-flex;
  home.file.".local/share/fonts/google-sans-flex-rounded".source = ../../fonts/google-sans-rounded;
}