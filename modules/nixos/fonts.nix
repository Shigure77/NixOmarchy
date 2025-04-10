{ pkgs, ... }:

{
  fonts = {
    enableDefaultFonts = true;

    fonts = with pkgs; [
      noto-fonts
      ubuntu_font_family
      unifont
      noto-fonts-cjk-sans
    ];

    fontconfig = {
      antialias = true;
    };
  };
}