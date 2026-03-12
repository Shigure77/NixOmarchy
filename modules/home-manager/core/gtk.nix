# GTK theme and icon theme (Adwaita-dark, Adwaita icons).
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    yaru-theme
    gnome-themes-extra
    adwaita-icon-theme
    liberation_ttf
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.yaru-theme;
    };
    cursorTheme = {
      name = "Adwaita";
      size = 24;
    };
    font = {
      name = "Liberation Sans";
      size = 11;
      package = pkgs.liberation_ttf;
    };
  };
}
