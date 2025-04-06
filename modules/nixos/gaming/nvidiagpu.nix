{ pkgs, ... }:

{
  #this is optional with steam enabled
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32 = true;
  }

  services.xserver.videoDrivers = ["nvidia"];
  #enable below only if theres an issue
  #hardware.nvidia.modesetting.enable = true;



}