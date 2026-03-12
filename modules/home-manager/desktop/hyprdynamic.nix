# HyprDynamicMonitors: dynamic monitor config for Hyprland (autorandr-style).
# Requires hyprdynamicmonitors.homeManagerModules.default in flake.nix.
# Config path: ~/.config/hyprdynamicmonitors/config.toml (set config or configFile to customize).
{ ... }:
{
  home.hyprdynamicmonitors = {
    enable = true;
    # installExamples = true;  # default: minimal example config if no config/configFile
    # config = '' ... inline TOML ... '';
    # configFile = /path/to/config.toml;
    # installThemes = false;
  };
}
