# NixOS modules. VSCodium is configured in Home Manager (modules/home-manager/apps/vscode.nix), not here.
{ pkgs, ... }:
{
  imports = [
    ./apps/console.nix
    ./apps/desktop.nix
    # ./apps/vscode.nix  # Disabled: use Home Manager programs.vscode (vscode.nix + vscode-extensions.nix) instead
    ./wireguard.nix
    ./flatpak.nix
    ./fonts.nix
    ./nfs.nix
    ./nvf.nix
    ./gaming/gameapps.nix
  ];
}
