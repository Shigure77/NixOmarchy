{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    audacity
    flameshot
    gpu-viewer
    gparted
    mission-center
    wireshark
    flatpak
    qdirstat
    file-roller
    anki-bin
    mpv
    wmctrl
  ];
}
