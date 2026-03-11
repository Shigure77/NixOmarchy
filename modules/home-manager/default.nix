# NixOmarchy home-manager: single entry (identity + category modules)
{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "keion";
    homeDirectory = "/home/keion";
    stateVersion = "24.11";
  };

  systemd.user.startServices = "sd-switch";

  imports = [
    ./core/default.nix
    ./terminal/shells.nix
    ./apps/vscode.nix
    ./apps/firefox.nix
    ./apps/packages.nix
    ./desktop/hyprland.nix
    ./desktop/hypridle.nix
    ./desktop/hyprlock.nix
    ./desktop/hyprpaper.nix
    ./theme/icons.nix
    ./ui/tools.nix
  ];
}
