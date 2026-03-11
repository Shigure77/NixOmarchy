{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
        ms-python.python
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-ssh
        mikestead.dotenv
        editorconfig.editorconfig
        jnoortheen.nix-ide
        redhat.vscode-yaml
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
      ];
    })
  ];
}
