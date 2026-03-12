# Hyprland exec-once (autostart). Uncomment lines when you add the corresponding packages.
{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XCURSOR_THEME XCURSOR_SIZE GDK_SCALE HYPRCURSOR_THEME HYPRCURSOR_SIZE"
      "hypridle"
      "mako"
      "swayosd-server"
      # Uncomment when hyprland-polkit or polkit agent is installed:
      # "systemctl --user start hyprpolkitagent"
      # Uncomment when cliphist is installed (clipboard history; also need wl-paste):
      # "wl-paste --type text --watch cliphist store"
      # "wl-paste --type image --watch cliphist store"
      # Wallpaper: if using swaybg instead of hyprpaper service, uncomment and set path:
      # (optional) "${pkgs.swaybg}/bin/swaybg -i /path/to/wallpaper.png -m fill"
    ];
  };
}
