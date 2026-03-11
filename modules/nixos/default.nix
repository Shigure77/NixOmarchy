{ pkgs, ... }:

{
  # NixOmarchy extras
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
