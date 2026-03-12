# Hypridle: idle lock, dpms, suspend (omanix-style, no omanix-screensaver).
# brightnessctl dims the screen after dimTimeout; restore on activity.
{ pkgs, ... }:
let
  lockCmd = "hyprlock";
  # Optional: screensaver (uncomment when you have a screensaver, e.g. omanix-screensaver or xdg-screensaver):
  # screensaverTimeout = 150;  # seconds
  dimTimeout = 150;    # dim before lock
  lockTimeout = 1800;   # 5 min
  dpmsTimeout = 2400;   # 10 min
  suspendTimeout = 3000;  # 20 min
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
      };
      listener = [
        # Uncomment when you have a screensaver (e.g. omanix-screensaver):
        # { timeout = screensaverTimeout; on-timeout = "your-screensaver-command"; }
        # Dim screen after idle; restore on activity (brightnessctl -s saves, -r restores)
        { timeout = dimTimeout; on-timeout = "brightnessctl -s && brightnessctl set 10%"; on-resume = "brightnessctl -r"; }
        { timeout = lockTimeout; on-timeout = lockCmd; }
        { timeout = dpmsTimeout; on-timeout = "hyprctl dispatch dpms off"; on-resume = "hyprctl dispatch dpms on"; }
        { timeout = suspendTimeout; on-timeout = "systemctl suspend"; }
      ];
    };
  };
}
