# XDG Desktop Portal Hyprland: screencopy options live in ~/.config/hypr/xdph.conf
# (not in Hyprland's main config). Matches omarhcy_config/hypr/xdph.conf.
_: {
  xdg.configFile."hypr/xdph.conf".text = ''
    screencopy {
        custom_picker_binary = hyprland-preview-share-picker
        allow_token_by_default = true
    }
  '';
}
