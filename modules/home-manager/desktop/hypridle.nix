# Hypridle: idle dim, screensaver, lock, dpms, suspend. Matches omarhcy_config/hypr/hypridle.conf.
# brightnessctl dims; omanix-screensaver runs before lock (optional logo via --logo path).
{ pkgs, ... }:
let
  lockCmd = "hyprlock";
  screensaverCmd = "pidof hyprlock || omanix-screensaver";  # start screensaver if not already locked
  dimTimeout = 150;      # 2.5 min – dim
  screensaverTimeout = 1200;  # 20 min – screensaver (before lock)
  lockTimeout = 1800;   # 30 min – lock
  dpmsTimeout = 2400;   # 40 min – screen off
  suspendTimeout = 3000; # optional suspend
in
{
  home.packages = [ pkgs.brightnessctl ];

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = lockCmd;
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        unlock_cmd = "pidof hyprlock && killall hyprlock";
        inhibit_sleep = 3;
      };
      listener = [
        { timeout = dimTimeout; on-timeout = "brightnessctl -s && brightnessctl set 10%"; on-resume = "brightnessctl -r"; }
        # Screensaver (any key/mouse exits and hypridle continues; lock runs at lockTimeout)
        { timeout = screensaverTimeout; on-timeout = screensaverCmd; }
        { timeout = lockTimeout; on-timeout = lockCmd; }
        { timeout = dpmsTimeout; on-timeout = "hyprctl dispatch dpms off"; on-resume = "hyprctl dispatch dpms on && brightnessctl -r"; }
        { timeout = suspendTimeout; on-timeout = "systemctl suspend"; }
      ];
    };
  };
}
