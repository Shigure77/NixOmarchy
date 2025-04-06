{ pkgs, ... }:
{
    
  environment.systemPackages = with pkgs; [
    kitty
    btop #terminal resource monitor
    yazi #terminal file explorer
    oh-my-posh
    zsh
    oh-my-zsh
    starship #cross console terminal
    fastfetch #display hardware info
    duf #veiw disk utility in terminal
    pciutils
    wget
    killall
    
  ];



}