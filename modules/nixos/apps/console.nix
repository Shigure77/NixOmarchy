{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    kitty
    btop
    yazi
    oh-my-posh
    zsh
    oh-my-zsh
    starship
    fastfetch
    duf
    pciutils
    wget
    killall
  ];
}
