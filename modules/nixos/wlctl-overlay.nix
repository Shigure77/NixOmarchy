# Make wlctl (WiFi TUI) available. Overlay is applied in flake (nixpkgs.overlays).
{ config, pkgs, ... }:
{
  environment.systemPackages = [ pkgs.wlctl ];
}
