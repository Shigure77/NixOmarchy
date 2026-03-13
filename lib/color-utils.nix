# Color helpers (from omanix lib). Hex ↔ RGB, strip hash, etc.
{ lib }:
rec {
  stripHash = hex: lib.removePrefix "#" hex;

  hexToRgb = hex:
    let
      h = stripHash hex;
      r = lib.fromHexString (builtins.substring 0 2 h);
      g = lib.fromHexString (builtins.substring 2 2 h);
      b = lib.fromHexString (builtins.substring 4 2 h);
    in
    { inherit r g b; };

  hexToRgbDecimal = hex:
    let
      rgb = hexToRgb hex;
    in
    "${toString rgb.r}, ${toString rgb.g}, ${toString rgb.b}";

  hexToRgbaCss = hex: a:
    let
      rgb = hexToRgb hex;
    in
    "rgba(${toString rgb.r}, ${toString rgb.g}, ${toString rgb.b}, ${toString a})";
}
