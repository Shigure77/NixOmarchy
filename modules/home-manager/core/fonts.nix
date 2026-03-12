# Home fontconfig and font packages.
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    liberation_ttf
    inter
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    font-awesome
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Liberation Serif" ];
      sansSerif = [ "Liberation Sans" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
    };
  };
}
