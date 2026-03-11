# Hyprlock theme. Colors from nix-colors colorScheme.
{ config, nixColorsLib ? null, ... }:
let
  c = config.colorScheme.palette;
  stripHash = s: builtins.replaceStrings [ "#" ] [ "" ] (s or "");
  hexToRgb = hex: "rgb(${nixColorsLib.conversions.hexToRGBString ", " (stripHash hex)})";
  hexToRgba = hex: a: "rgba(${nixColorsLib.conversions.hexToRGBString ", " (stripHash hex)}, ${a})";
  # Fallback when nix-colors lib not available (e.g. when not using nix-colors)
  bg = if nixColorsLib != null then hexToRgba c.base00 "0.95" else "rgba(30, 30, 46, 0.95)";
  fg = if nixColorsLib != null then hexToRgb c.base05 else "rgb(205, 214, 244)";
  accent = if nixColorsLib != null then hexToRgb c.base0D else "rgb(137, 180, 250)";
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = true;
        ignore_empty_input = true;
      };
      background = [{
        path = "";
        blur_passes = 3;
        color = bg;
      }];
      input-field = [{
        size = "650, 100";
        position = "0, -100";
        halign = "center";
        valign = "center";
        outline_thickness = 4;
        dots_size = 0.33;
        dots_spacing = 0.15;
        dots_center = true;
        outer_color = fg;
        inner_color = bg;
        font_color = fg;
        fade_on_empty = false;
        placeholder_text = "Enter Password";
        check_color = accent;
        fail_text = " $FAIL ($ATTEMPTS) ";
      }];
      label = [
        {
          text = "$TIME";
          color = fg;
          font_size = 120;
          font_family = "sans";
          position = "0, 150";
          halign = "center";
          valign = "center";
        }
        {
          text = "cmd[update:1000] echo \"$(date +'%A, %d %B')\"";
          color = fg;
          font_size = 30;
          font_family = "sans";
          position = "0, 50";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
