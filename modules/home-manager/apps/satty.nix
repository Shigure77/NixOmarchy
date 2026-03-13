# Satty screenshot annotation (from omanix). Themed with nix-colors.
{ config, ... }:
let
  c = config.colorScheme.palette;
  hex = key: "#${c.${key}}";
  accent = hex "base0D";
  palette = [
    accent
    (hex "base08")
    (hex "base0B")
    (hex "base0A")
    (hex "base0D")
    (hex "base0E")
    (hex "base0C")
  ];
in
{
  programs.satty = {
    enable = true;
    settings = {
      general = {
        fullscreen = false;
        early-exit = true;
        copy-command = "wl-copy";
        save-after-copy = true;
        output-filename = "~/Pictures/screenshot-%Y-%m-%d_%H-%M-%S.png";
        "actions-on-enter" = [ "save-to-clipboard" ];
        "actions-on-escape" = [ "exit" ];
        initial-tool = "pointer";
        corner-roundness = 12;
        "annotation-size-factor" = 2;
        "brush-smooth-history-size" = 10;
        "no-window-decoration" = true;
      };
      font = {
        family = "JetBrainsMono Nerd Font";
        style = "Regular";
      };
      "color-palette" = {
        palette = palette;
      };
    };
  };
}
