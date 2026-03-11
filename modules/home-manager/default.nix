# NixOmarchy home-manager: single entry (identity + category modules)
{ config, pkgs, inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  # Unified theming via nix-colors (used by ghostty, hyprlock, hyprland visuals)
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;

  home = {
    username = "keion";
    homeDirectory = "/home/keion";
    stateVersion = "24.11";
  };

  systemd.user.startServices = "sd-switch";

  imports = [
    ./core/default.nix
    ./terminal/shells.nix
    ./terminal/ghostty.nix
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
