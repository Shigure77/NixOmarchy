{ pkgs, ... }:

{

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    protonup

    lutris
    bottles #wine prefix manager
  ];

  programs.gamemode.enable = true;

}