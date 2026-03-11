# Hypridle: idle lock, dpms, suspend (omanix-style, no omanix-screensaver).
# Optional: add brightnessctl to home.packages and uncomment dimScreen listener.
{ ... }:
let
  lockCmd = "hyprlock";
  # Optional: screensaver (uncomment when you have a screensaver, e.g. omanix-screensaver or xdg-screensaver):
  # screensaverTimeout = 150;  # seconds
  lockTimeout = 300;   # 5 min
  dpmsTimeout = 600;   # 10 min
  suspendTimeout = 1200;  # 20 min
in
{
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
        # Uncomment when brightnessctl is installed (home.packages = [ pkgs.brightnessctl ];):
        # { timeout = 840; on-timeout = "brightnessctl -s set 10"; on-resume = "brightnessctl -r"; }
        { timeout = lockTimeout; on-timeout = lockCmd; }
        { timeout = dpmsTimeout; on-timeout = "hyprctl dispatch dpms off"; on-resume = "hyprctl dispatch dpms on"; }
        { timeout = suspendTimeout; on-timeout = "systemctl suspend"; }
      ];
    };
  };
}
