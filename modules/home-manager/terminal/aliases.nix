# Unified aliases for bash and zsh. commonAliases is used by both; remove duplicates/conflicts as needed.
{ config, lib, pkgs, ... }:
let
  # Merged (zsh overwrites on duplicate keys); edit to resolve conflicts
  commonAliases = {
    
    # List commands
    ll = "eza -alh";
    ls = "eza";
    tree = "eza --tree --level=2 --long --icons --git";
    treelong = "eza --tree --git-ignore";

    # Terminal misc (quoted keys required in Nix for names like .. and ...)
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    c = "clear";
    h = "history";
    cdp = "pwd | xclip -selection clipboard";
    cfp = "(){ readlink -f $1 | xclip -selection clipboard }";
    rm = "rm -ir";
    grep = "grep --color=auto";
    rsync = "rsync -auhPA --info=progress2";

    # Utilities
    cat = "bat";
    #cat = "bat -pp"; # Use this to remove the bars from default bat
    top = "btop";
    df = "duf";
    man = "batman";

    # Nix commands
    nrs = "sudo nixos-rebuild switch";
    hms = "home-manager switch --impure --flake ~/.config/nixos/#user";
    garbage = "doas nix-collect-garbage --delete-older-than 3d";
    se = "sudoedit";
    nixhardware = "nixos-generate-config --show-hardware-config > /home/keion/NixOmarchy/hardware-configuration.nix";

  };
in
{
  programs.bash.shellAliases = commonAliases;
  programs.zsh.shellAliases = commonAliases;
}
