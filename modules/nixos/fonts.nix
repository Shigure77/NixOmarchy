{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      noto-fonts
      ubuntu_font_family
      unifont
      noto-fonts-cjk-sans #Japanese
      carlito
      dejavu_fonts
      ipafont #japanese
      kochi-substitute #Japanese
      source-code-pro
      ttf_bitstream_vera
    ];

    fontconfig = {
      antialias = true;
    };
  };
}