# Walker app launcher + Elephant (omanix-style). Requires walker.homeManagerModules.default in flake.
{ ... }:
{
  programs.walker = {
    enable = true;
    # Optional: run as service for faster launch (starts elephant + walker daemon)
    # runAsService = true;
  };
}
