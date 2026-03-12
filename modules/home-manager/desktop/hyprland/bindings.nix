# Hyprland keybindings (omanix-style, deps commented or replaced).
# Default terminal = ghostty. Uncomment/adapt launchers when you add: waybar, walker, mako, swayosd, etc.
{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "ghostty";

    bind = [
      # Basic
      "$mod, Return, exec, $terminal"
      "$mod, W, killactive"
      "$mod, L, exec, hyprlock"
      "$mod, M, exit"
      # Window
      "$mod, J, togglesplit"
      "$mod, P, pseudo"
      "$mod, T, togglefloating"
      "$mod, F, fullscreen, 0"
      "$mod, LEFT, movefocus, l"
      "$mod, RIGHT, movefocus, r"
      "$mod, UP, movefocus, u"
      "$mod, DOWN, movefocus, d"
      # Workspaces
      "$mod, code:10, workspace, 1"
      "$mod, code:11, workspace, 2"
      "$mod, code:12, workspace, 3"
      "$mod, code:13, workspace, 4"
      "$mod, code:14, workspace, 5"
      "$mod SHIFT, code:10, movetoworkspace, 1"
      "$mod SHIFT, code:11, movetoworkspace, 2"
      "$mod SHIFT, code:12, movetoworkspace, 3"
      "$mod SHIFT, code:13, movetoworkspace, 4"
      "$mod SHIFT, code:14, movetoworkspace, 5"
      "$mod, TAB, workspace, e+1"
      "$mod SHIFT, TAB, workspace, e-1"
      "$mod CTRL, TAB, workspace, previous"
      # Swap
      "$mod SHIFT, LEFT, swapwindow, l"
      "$mod SHIFT, RIGHT, swapwindow, r"
      "$mod SHIFT, UP, swapwindow, u"
      "$mod SHIFT, DOWN, swapwindow, d"
      # Resize
      "$mod, r, resizeactive, -100 0"
      "$mod, t, resizeactive, 100 0"
      "$mod SHIFT, r, resizeactive, 0 -100"
      "$mod SHIFT, t, resizeactive, 0 100"
      # App launcher (walker; elephant provides data)
      "$mod, SPACE, exec, walker"
      # Notifications (mako)
      "$mod, COMMA, exec, makoctl dismiss"
      "$mod SHIFT, COMMA, exec, makoctl dismiss --all"
      # Waybar toggle
      "$mod SHIFT, SPACE, exec, pkill -SIGUSR1 waybar"
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    # Media / OSD (swayosd) – no mod key
    bindel = [
      ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
      ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
      ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
      ", XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
      ", XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
      ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
    ];
    bindl = [
      ", XF86AudioNext, exec, swayosd-client --playerctl next"
      ", XF86AudioPrev, exec, swayosd-client --playerctl previous"
      ", XF86AudioPlay, exec, swayosd-client --playerctl play-pause"
      ", XF86AudioPause, exec, swayosd-client --playerctl play-pause"
    ];
  };
}
