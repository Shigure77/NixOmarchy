# Hyprsunset config. Matches omarhcy_config/hypr/hyprsunset.conf (identity profile = no tint by default).
# Install hyprsunset separately if you use it; this only writes the config.
_: {
  xdg.configFile."hypr/hyprsunset.conf".text = ''
    # Makes hyprsunset do nothing to the screen by default
    # Without this, the default applies some tint to the monitor
    profile {
        time = 00:00
        identity = true
    }
  '';
}
