# NixOmarchy home-manager: single entry (identity + category modules)
{ config, pkgs, inputs, nixColorsScheme, ... }:
{
  nixpkgs.config.allowUnfree = true;

  # Unified theming via nix-colors (scheme set in flake.nix as nixColorsScheme)
  colorScheme = nixColorsScheme;

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
    ./desktop/walker.nix
    ./desktop/hypridle.nix
    ./desktop/hyprlock.nix
    ./desktop/hyprpaper.nix
    ./theme/icons.nix
    ./ui/tools.nix
    ./ui/mako.nix
    ./ui/waybar.nix
    ./ui/swayosd.nix
    ./ui/hidden-apps.nix
  ];
}
