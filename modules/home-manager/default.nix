{ pkgs, ...}:

{
  # List your module files here
  # my-module = import ./my-module.nix;
  imports = [
    ./catppuccin.nix
    
  ];


}
