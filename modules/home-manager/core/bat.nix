# Bat theme from lib (lib theme is derived from nix-colors). cat -> bat is in terminal/aliases.nix.
{ config, lib, nixomarchyActiveTheme ? null, ... }:
{
  programs.bat = {
    enable = true;
    config.theme = if nixomarchyActiveTheme != null then nixomarchyActiveTheme.bat.name else "base16";
  };
}
