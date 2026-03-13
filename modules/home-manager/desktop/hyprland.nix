# Hyprland DE: enable + submodules (envs, input, visuals, autostart, bindings).
# NixOS must have programs.hyprland.enable + SDDM so the session exists at login.
# Default terminal: ghostty (see terminal/ghostty.nix).
{ config, pkgs, ... }:
{
  # hyprlock package is provided by programs.hyprlock in desktop/hyprlock.nix

  wayland.windowManager.hyprland = {
    enable = true;
    # Settings are merged from the hyprland/*.nix modules below.
  };

  imports = [
    ./hyprland/envs.nix
    ./hyprland/monitors.nix
    ./hyprland/input.nix
    ./hyprland/visuals.nix
    ./hyprland/xdph.nix
    ./hyprland/autostart.nix
    ./hyprland/bindings.nix
  ];
}
