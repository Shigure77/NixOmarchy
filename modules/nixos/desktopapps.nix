{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    audacity
    flameshot #screenshots
    gpu-viewer
    gparted
    mission-center #resource monitor
    wireshark
    flatpak
    qdirstat
    file-roller
    anki-bin
    mpv #for anki
    ulauncher 
    wmctrl #required for ulauncher
  ];

}