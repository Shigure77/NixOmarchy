# XDG Desktop Portal Hyprland (screencopy). Matches omarhcy_config/hypr/xdph.conf.
_: {
  wayland.windowManager.hyprland.settings = {
    screencopy = {
      custom_picker_binary = "hyprland-preview-share-picker";
      allow_token_by_default = true;
    };
  };
}
