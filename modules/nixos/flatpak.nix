#got this from this flake https://github.com/gmodena/nix-flatpak?tab=readme-ov-file
{ pkgs, ... }:

{
  services.flatpak = {
    enable = true;
    packages = [
      { appId = "app.zen_browser.zen"; origin = "flathub";  }
      "org.onlyoffice.desktopeditors"
    ];
  };


}