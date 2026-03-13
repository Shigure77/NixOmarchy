# VSCodium + shared extensions (see vscode-extensions.nix)
{ config, lib, pkgs, ... }:
{
  programs.vscode = {
    package = pkgs.vscodium;
    profiles.default.extensions = lib.mkAfter (config.nixomarchy.vscodeExtensions or [ ]);
  };
}
