# Screensaver: omanix-screensaver (from pkgs/) + shutdown cleanup.
# Hypridle runs the screensaver via desktop/hypridle.nix (listener timeout 1200).
# Uses overlayedPkgs from flake so the custom package is available to Home Manager.
{ pkgs, overlayedPkgs ? pkgs, ... }:
{
  home.packages = [ overlayedPkgs.omanix-screensaver ];

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
