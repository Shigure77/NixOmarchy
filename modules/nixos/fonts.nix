{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      noto-fonts
      ubuntu-classic
      unifont
      noto-fonts-cjk-sans #Japanese
      carlito
      dejavu_fonts
      ipafont #japanese
      kochi-substitute #Japanese
      source-code-pro
      ttf_bitstream_vera
      # Nerd Fonts: required for Waybar/status bar icons (󰕾 󰁺 󰤯 etc.)
      nerd-fonts.jetbrains-mono
    ];

    fontconfig = {
      antialias = true;
    };
  };
}