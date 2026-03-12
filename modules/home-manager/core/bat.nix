# Bat with base16 theme; cat -> bat for zsh.
{ config, lib, ... }:
{
  programs.bat = {
    enable = true;
    config.theme = "base16";
  };

  programs.zsh.shellAliases = lib.mkIf config.programs.zsh.enable {
    cat = "bat -pp";
  };
}
