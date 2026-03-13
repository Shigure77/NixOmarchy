# Spotify (from omanix). Enable via nixomarchy.apps.spotify.enable.
{ config, pkgs, lib, ... }:
{
  options.nixomarchy.apps.spotify = {
    enable = lib.mkEnableOption "Spotify";
  };

  config = lib.mkIf config.nixomarchy.apps.spotify.enable {
    home.packages = [ pkgs.spotify ];
  };
}
