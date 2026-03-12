# Notifications (from omanix). Themed with nix-colors.
{ config, ... }:
let
  c = config.colorScheme.palette;
  hex = key: "#${c.${key}}";
  bg = hex "base00";
  fg = hex "base05";
  accent = hex "base0D";
in
{
  services.mako = {
    enable = true;
    settings = {
      anchor = "top-right";
      default-timeout = 5000;
      width = 420;
      outer-margin = 20;
      padding = "10,15";
      border-size = 2;
      max-icon-size = 32;
      font = "sans-serif 14px";
      text-color = fg;
      border-color = accent;
      background-color = bg;
      "app-name=Spotify" = { invisible = 1; };
      "mode=do-not-disturb" = { invisible = true; };
      "mode=do-not-disturb app-name=notify-send" = { invisible = false; };
      "urgency=critical" = {
        default-timeout = 0;
        layer = "overlay";
      };
    };
  };
}
