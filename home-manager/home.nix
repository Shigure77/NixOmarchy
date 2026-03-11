# NixOmarchy home config

{ inputs, config, pkgs, ... }:

let
  suru-icons = pkgs.stdenvNoCC.mkDerivation {
    pname = "suru-plus";
    version = "2019-07-24";
    src = pkgs.fetchzip {
      url = "https://github.com/gusbemacbe/suru-plus/archive/master.tar.gz";
      sha256 = "cclNopwx73BiFB/aHm/aHHbhjFxPL+xwP1L1je5iPwU=";
    };
    installPhase = ''
      mkdir -p $out/share/icons
      cp -r * $out/share/icons/
    '';
  };
in
{
  imports = [ ../modules/home-manager/default.nix ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "keion";
    homeDirectory = "/home/keion";
    stateVersion = "24.11";
  };

  programs = {
    firefox.enable = true;
    bash.enable = true;
    fish.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh.enable = true;
      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };
    };
    home-manager.enable = true;
  };

  # Extra packages
  home.packages = with pkgs; [
    dconf-editor
    dconf2nix
    plex-desktop
    discord
    nfs-utils
    #nfstrace #nfs monitoring tool seems broken
    suru-icons
    fishPlugins.puffer
    fishPlugins.pure
  ];

  systemd.user.startServices = "sd-switch";
}
