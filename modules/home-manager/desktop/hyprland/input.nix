# Hyprland input. Matches omarhcy_config/hypr/input.conf.
_: {
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      follow_mouse = 1;
      numlock_by_default = true;
      kb_options = "compose:caps";
      repeat_rate = 40;
      repeat_delay = 600;
      touchpad = {
        natural_scroll = true;
        scroll_factor = 0.4;
      };
    };
    gesture = [
      "3, horizontal, workspace"
    ];
    # Scroll faster in terminal (matches omarhcy; windowrule is the current syntax, windowrulev2 was removed)
    windowrule = [
      "scroll_touchpad 1.5, match:tag terminal"
    ];
  };
}
