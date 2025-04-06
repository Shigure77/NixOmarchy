{ pkgs, ... }:

{
  #this is optional with steam enabled
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32 = true;
  }

  services.xserver.videoDrivers = ["amdgpu"];



}