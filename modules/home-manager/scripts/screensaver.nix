# Screensaver cleanup (from omanix). Uncomment when omanix-screensaver or another screensaver is used.
# The omanix-screensaver package is from the omanix flake; not available in this config.
{ pkgs, ... }:
{
  # home.packages = [ pkgs.omanix-screensaver ];

  systemd.user.services.omanix-screensaver-cleanup = {
    Unit = {
      Description = "Cleanup screensaver on shutdown";
      Before = [ "shutdown.target" "reboot.target" "halt.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.procps}/bin/pkill -f 'omanix-screensaver' || true";
      TimeoutStartSec = "2s";
    };
    Install = {
      WantedBy = [ "shutdown.target" ];
    };
  };
}
