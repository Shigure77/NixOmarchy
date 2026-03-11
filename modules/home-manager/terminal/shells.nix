# Terminal: zsh + fish plugins
{ pkgs, ... }:
{
  programs.zsh = {
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

  home.packages = with pkgs; [
    fishPlugins.puffer
    fishPlugins.pure
  ];
}
