{ pkgs, ... }:

{
  # NixOmarchy extras; theme/editor come from omarchy-nix
  imports = [
    ./consoleapps.nix
    ./desktopapps.nix
    ./wireguard.nix
    ./flatpak.nix
    ./fonts.nix
    ./nfs.nix
    ./nvf.nix
    ./gaming/gameapps.nix
  ];
}
