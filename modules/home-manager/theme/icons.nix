# Theme: Suru Plus icon set
{ pkgs, ... }:
let
  suru-icons = pkgs.stdenvNoCC.mkDerivation {
    pname = "suru-plus";
    version = "2019-07-24";
    src = pkgs.fetchzip {
      url = "https://github.com/gusbemacbe/suru-plus/archive/master.tar.gz";
      sha256 = "cclNopwx73BiFB/aHm/aHHbhjFxPL+xwP1L1je5iPwU=";
    };
    installPhase = ''
      mkdir -p $out/share/icons
      cp -r * $out/share/icons/
    '';
  };
in
{
  home.packages = [ suru-icons ];
}
