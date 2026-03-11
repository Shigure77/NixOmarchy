# Core: bash, fish, home-manager
{ ... }:
{
  programs = {
    bash.enable = true;
    fish.enable = true;
    home-manager.enable = true;
  };
}
