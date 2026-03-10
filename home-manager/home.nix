# NixOmarchy home config; omarchy-nix provides theme, ghostty, starship, git, etc.

{ inputs, config, pkgs, ... }:

let
  suru-icons = pkgs.stdenvNoCC.mkDerivation {
    pname = "suru-plus";
    version = "2019-07-24";
    src = pkgs.fetchzip {
      url = "https://github.com/gusbemacbe/suru-plus/archive/master.tar.gz";
      sha256 = "bZSLdRfEUmN4+A63ZVaOaK02L85b4nscXk95EU/trF0=";
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

  # Extra packages (omarchy-nix already provides e.g. vlc, btop, starship)
  home.packages = with pkgs; [
    dconf-editor
    dconf2nix
    plex-desktop
    discord
    nfs-utils
    nfstrace #nfs monitoring tool
    suru-icons
    fishPlugins.puffer
    fishPlugins.pure
  ];

  systemd.user.startServices = "sd-switch";
}
