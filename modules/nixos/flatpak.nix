#got this from this flake https://github.com/gmodena/nix-flatpak?tab=readme-ov-file
{ pkgs, ... }:

{
  services.flatpak = {
    enable = true;
    packages = [
      # Zen: installed via zen-browser flake (modules/home-manager/apps/zen-browser.nix)
      "org.onlyoffice.desktopeditors"
    ];
  };


}