# Display scaling. Adjust the scale value to change UI size (1 = 100%, 1.25 = 125%, 1.5 = 150%, 2 = 200%).
# If you use hyprdynamicmonitors, it may override this at startup; set scale in ~/.config/hyprdynamicmonitors/config.toml instead.
# Valid scales (must give whole logical pixels): 1, 1.25, 1.5, 1.6667, 2, etc. Use "auto" for PPI-based scaling.
_: {
  wayland.windowManager.hyprland.settings = {
    monitor = [
      ",preferred,auto,1"  # <name>, <res>@<rate>, <position>, <scale> — change last number for scaling
    ];
  };
}
