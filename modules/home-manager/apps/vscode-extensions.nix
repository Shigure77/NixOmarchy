# Shared VS Code / Cursor extension list. Used by vscode.nix and cursor.nix.
{ config, lib, pkgs, ... }:
{
  options.nixomarchy.vscodeExtensions = lib.mkOption {
    type = lib.types.listOf lib.types.package;
    default = with pkgs.vscode-extensions; [
      ms-python.python
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-ssh
      mikestead.dotenv
      editorconfig.editorconfig
      jnoortheen.nix-ide
      redhat.vscode-yaml
    ];
    description = "Shared extensions for VSCodium and Cursor.";
  };
}
