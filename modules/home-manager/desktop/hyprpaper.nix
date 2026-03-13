# Hyprpaper: wallpaper daemon. Uses lib theme wallpapers when nixomarchyActiveTheme.assets.wallpapers is non-empty.
{ lib, nixomarchyActiveTheme ? null, ... }:
let
  theme = nixomarchyActiveTheme;
  wallpapers = if theme != null then theme.assets.wallpapers else [ ];
  firstWallpaper = if wallpapers != [ ] then builtins.head wallpapers else null;
  wallpaperSettings = if firstWallpaper != null then {
    preload = [ firstWallpaper ];
    # Default monitor: comma prefix then path
    wallpaper = [ ",${firstWallpaper}" ];
  } else { };
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
    } // wallpaperSettings;
  };
}
