# Hyprland DE (declarative in Home Manager).
# NixOS must have programs.hyprland.enable + SDDM so the session exists at login.
{ config, pkgs, ... }:
{
  programs.foot.enable = true;
  home.packages = [ pkgs.hyprlock ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, Return, exec, foot"
        "$mod, Q, killactive"
        "$mod, L, exec, hyprlock"
        "$mod, M, exit"
      ];
      misc = { vfr = true; };
    };
  };
}
