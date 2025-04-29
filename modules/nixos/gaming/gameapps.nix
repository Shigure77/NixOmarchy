{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    openmw #morrowind
    #portmod #morrowing mod manager
    prismlauncher #minecraft
    lutris
    bottles #wine prefix manager
  ];



}