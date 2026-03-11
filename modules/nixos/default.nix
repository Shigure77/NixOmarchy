{ pkgs, ... }:
{
  imports = [
    ./apps/console.nix
    ./apps/desktop.nix
    ./apps/vscode.nix
    ./wireguard.nix
    ./flatpak.nix
    ./fonts.nix
    ./nfs.nix
    ./nvf.nix
    ./gaming/gameapps.nix
  ];
}
