# Ghostty terminal (from omanix). Colors from nix-colors colorScheme.
{ config, pkgs, ... }:
let
  c = config.colorScheme.palette;
  # base16 terminal palette mapping
  hex = key: "#${c.${key}}";
in
{
  programs.ghostty = {
    enable = true;
    settings = {
      command = "${pkgs.zsh}/bin/zsh";

      window-padding-x = 14;
      window-padding-y = 14;
      window-decoration = false;
      confirm-close-surface = false;
      resize-overlay = "never";
      gtk-toolbar-style = "flat";

      cursor-style = "block";
      cursor-style-blink = false;
      mouse-scroll-multiplier = 1.0;
      font-family = "JetBrains Mono";
      font-style = "Regular";
      font-size = 13;

      background = hex "base00";
      foreground = hex "base05";
      cursor-color = hex "base05";
      selection-background = hex "base02";
      selection-foreground = hex "base05";

      palette = [
        "0=${hex "base00"}"
        "1=${hex "base08"}"
        "2=${hex "base0B"}"
        "3=${hex "base0A"}"
        "4=${hex "base0D"}"
        "5=${hex "base0E"}"
        "6=${hex "base0C"}"
        "7=${hex "base05"}"
        "8=${hex "base03"}"
        "9=${hex "base08"}"
        "10=${hex "base0B"}"
        "11=${hex "base0A"}"
        "12=${hex "base0D"}"
        "13=${hex "base0E"}"
        "14=${hex "base0C"}"
        "15=${hex "base07"}"
      ];
    };
  };
}
