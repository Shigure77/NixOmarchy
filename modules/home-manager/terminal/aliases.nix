
{ config, lib, pkgs, ... }:

{
  programs.bash.shellAliases = {
    # List commands
    ll = "eza -alh";
    ls = "eza";
    tree = "eza --tree --git-ignore";

    # Terminal misc (quoted keys required in Nix for names like .. and ...)
    ".." = "cd ..";
    "..." = "cd ../..";
    c = "clear";
    h = "history";
    cdp = "pwd | xclip -selection clipboard";
    cfp = "(){ readlink -f $1 | xclip -selection clipboard }";
    rm = "rm -ir";
    grep = "grep --color=auto";
    rsync = "rsync -auhPA --info=progress2";

    # Utilities
    cat = "bat";
    top = "btop";
    df = "duf";
    man = "batman";

    # Nix commands
    nrs = "sudo nixos-rebuild switch";
    hms = "home-manager switch --impure --flake ~/.config/nixos/#user";
    garbage = "doas nix-collect-garbage --delete-older-than 3d";
    se = "sudoedit";
  };
}