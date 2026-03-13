# Theme definitions (omanix-style schema). Colors are derived from nix-colors; meta/assets/bat are static.
# nix-colors is the source of truth; use themes.fromNixColors(scheme) to build the active theme.
{ lib }:
let
  # Ensure hex has leading # for lib theme shape (nix-colors palette may or may not include #)
  hex = key: palette: "#${lib.removePrefix "#" palette.${key}}";

  # Map nix-colors palette (base00–base0F) to lib theme .colors shape.
  paletteToThemeColors = palette: {
    background = hex "base00" palette;
    foreground = hex "base05" palette;
    accent = hex "base0D" palette;
    cursor = hex "base05" palette;
    selection_background = hex "base0D" palette;
    selection_foreground = hex "base05" palette;

    color0 = hex "base00" palette;
    color1 = hex "base08" palette;
    color2 = hex "base0B" palette;
    color3 = hex "base0A" palette;
    color4 = hex "base0D" palette;
    color5 = hex "base0E" palette;
    color6 = hex "base0C" palette;
    color7 = hex "base05" palette;
    color8 = hex "base03" palette;
    color9 = hex "base08" palette;
    color10 = hex "base0B" palette;
    color11 = hex "base0A" palette;
    color12 = hex "base0D" palette;
    color13 = hex "base0E" palette;
    color14 = hex "base0C" palette;
    color15 = hex "base07" palette;
  };

  # Static meta/assets/bat for the default theme (Gruvbox). Colors come from nix-colors.
  defaultMeta = {
    name = "Gruvbox Dark";
    slug = "gruvbox-dark";
    icon_theme = "Adwaita";
  };

  defaultAssets = {
    wallpapers = [ ];
  };

  defaultBat = {
    name = "base16";
    url = null;
    sha256 = null;
  };
in
{
  # Build a full theme from a nix-colors scheme. Scheme must have .palette (base00–base0F).
  fromNixColors = scheme: {
    meta = defaultMeta;
    assets = defaultAssets;
    bat = defaultBat;
    colors = paletteToThemeColors scheme.palette;
  };
}
