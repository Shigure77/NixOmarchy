{ pkgs ? import <nixpkgs> {}
, stdenvNoCC ? pkgs.stdenvNoCC
, fetchzip ? pkgs.fetchzip
, gtk3 ? pkgs.gtk3
, jdupes ? pkgs.jdupes
}:

stdenvNoCC.mkDerivation rec {
  pname = "suru-plus";
  name = pname;
  version = "2019-07-24";

  src = fetchzip{
    url = "https://github.com/gusbemacbe/suru-plus/archive/master.tar.gz";
    sha256 = "bZSLdRfEUmN4+A63ZVaOaK02L85b4nscXk95EU/trF0=";
  };

  nativeBuildInputs = [ 
    gtk3 
    jdupes
  ];

  dontPatchELF = true;
  dontRewriteSymlinks = true;
  dontDropIconThemeCache = true;

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r * $out/share/icons/


  '';


  # meta = with lib; {
  #   description = "A cyberpunkish, elegant, futuristic, macOS-like, Papirus-like and modern Suru icons based on Suru Icons by Sam Hewitt";
  #   #homepage = https://drasite.com/flat-remix;
  #   license = with licenses; [ gpl3 ];
  #   platforms = platforms.all;
  #   maintainers = with maintainers; [ gusbemacbe ];
  # };
}