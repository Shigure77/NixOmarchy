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

  # Git identity (used by core/git.nix)
  nixomarchy.git.user = {
    name = "Keion";
    email = "keioncollins@gmail.com";
  };

  systemd.user.startServices = "sd-switch";

  imports = [
    ./core/default.nix
    ./core/shell.nix
    ./core/fonts.nix
    ./core/gtk.nix
    ./core/git.nix
    ./core/languages.nix
    ./core/bat.nix
    ./scripts/default.nix
    ./terminal/ghostty.nix
    ./terminal/aliases.nix
    ./apps/vscode-extensions.nix
    ./apps/vscode.nix
    ./apps/cursor.nix
    ./apps/firefox.nix
    ./apps/packages.nix
    ./apps/zen-browser.nix
    ./apps/btop.nix
    ./apps/jetbrains.nix
    ./apps/mpv.nix
    ./apps/neovim.nix
    ./apps/satty.nix
    ./apps/spotify.nix
    ./desktop/hyprland.nix
    ./desktop/hyprdynamic.nix
    ./desktop/walker.nix
    ./desktop/hypridle.nix
    ./desktop/hyprlock.nix
    ./desktop/hyprpaper.nix
    ./desktop/hyprsunset.nix
    ./theme/icons.nix
    ./ui/tools.nix
    ./ui/mako.nix
    ./ui/waybar.nix
    ./ui/swayosd.nix
    ./ui/hidden-apps.nix
  ];
}
