# Hyprpaper: wallpaper daemon. Set wallpaper path when you have one.
# Add a wallpaper path (e.g. from nixos-artwork or your assets) and uncomment preload/wallpaper.
{ ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      # When you have a wallpaper, add e.g.:
      # preload = [ "/path/to/wallpaper.png" ];
      # wallpaper = [ ",/path/to/wallpaper.png" ];
    };
  };
}
