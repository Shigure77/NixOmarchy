# Hyprland env vars (from omanix). Set GDK_SCALE / QT_SCALE_FACTOR for app-level scaling (e.g. 1.25 = 125%).
_: {
  wayland.windowManager.hyprland.settings = {
    env = [
      "XCURSOR_THEME,Adwaita"
      "XCURSOR_SIZE,24"
      # "GDK_SCALE,1.25"       # Uncomment and set for GTK apps (1, 1.25, 1.5, 2, …)
      # "QT_SCALE_FACTOR,1.25" # Uncomment and set for Qt apps
      "HYPRCURSOR_THEME,Adwaita"
      "HYPRCURSOR_SIZE,24"
      "GDK_BACKEND,wayland,x11,*"
      "QT_QPA_PLATFORM,wayland;xcb"
      "SDL_VIDEODRIVER,wayland"
      "CLUTTER_BACKEND,wayland"
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"
      "GTK_THEME,Adwaita-dark"
      "GTK_IM_MODULE,"
    ];
  };
}
