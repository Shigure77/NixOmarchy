# Apps: extra application packages
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    plex-desktop
    discord
    nfs-utils
  ];
}
