# Hyprland env vars (from omanix)
_: {
  wayland.windowManager.hyprland.settings = {
    env = [
      "XCURSOR_THEME,Adwaita"
      "XCURSOR_SIZE,24"
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
