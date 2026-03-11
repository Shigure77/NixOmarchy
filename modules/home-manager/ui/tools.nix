# UI: desktop/UI configuration tools
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dconf-editor
    dconf2nix
  ];
}
