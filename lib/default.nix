# NixOmarchy lib (omanix-style). Exposes color utils and theme data.
# nix-colors is the source of truth; themes.fromNixColors(scheme) derives the lib theme from it.
{ lib }:
{
  colors = import ./color-utils.nix { inherit lib; };
  themes = import ./themes.nix { inherit lib; };
}
