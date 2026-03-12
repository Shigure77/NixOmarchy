# Hide desktop entries from app launchers (from omanix).
{ lib, ... }:
let
  appsToHide = [
    "org.fcitx.Fcitx5"
    "fcitx5-configtool"
    "fcitx5-wayland-launcher"
    "kbd-layout-viewer5"
    "kcm_fcitx5"
    "avahi-discover"
    "bssh"
    "bvnc"
    "cmake-gui"
    "cups"
    "java-java-openjdk"
    "jconsole-java-openjdk"
    "jshell-java-openjdk"
    "kcm_kaccounts"
    "kvantummanager"
    "btop"
  ];
in
{
  xdg.dataFile = lib.genAttrs (map (name: "applications/${name}.desktop") appsToHide) (_: {
    text = "[Desktop Entry]\nHidden=true";
  });
}
