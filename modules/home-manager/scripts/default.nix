# Scripts (from omanix). Runtime deps for grim/slurp/wl-clipboard etc.; no omanix-scripts package.
# Screensaver is optional (commented out in screensaver.nix if omanix-screensaver is not available).
{ pkgs, config, ... }:
{
  imports = [ ./screensaver.nix ];

  home.packages = with pkgs; [
    jq
    procps
    grim
    slurp
    wl-clipboard
    libnotify
    hyprpicker
    libxkbcommon
    gawk
    gnused
    envsubst
    swaybg
    wlctl
    glow

    playerctl
    brightnessctl
    wireplumber

    gpu-screen-recorder
    ffmpeg
    v4l-utils

    fastfetch
    networkmanagerapplet
  ];
}
