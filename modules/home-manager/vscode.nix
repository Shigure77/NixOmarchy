# Use VSCodium and add NixOmarchy extensions (omarchy-nix extensions take precedence)
{ config, lib, pkgs, ... }:

{
  programs.vscode = {
    package = pkgs.vscodium;
    # Append only our extensions; omarchy-nix already provides bbenoist.nix, vscodevim.vim, theme extensions (incl. gruvbox)
    profiles.default.extensions = lib.mkAfter (with pkgs.vscode-extensions; [
      ms-python.python
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-ssh
      mikestead.dotenv
      editorconfig.editorconfig
      jnoortheen.nix-ide
      redhat.vscode-yaml
    ]);
  };
}
