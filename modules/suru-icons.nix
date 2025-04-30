{ pkgs ? import <nixpkgs> {}
, stdenvNoCC ? pkgs.stdenvNoCC
, fetchFromGitHub ? pkgs.fetchFromGitHub
, gtk3 ? pkgs.gtk3
, jdupes ? pkgs.jdupes
, wget ? pkgs.wget
}:

stdenvNoCC.mkDerivation rec {
  pname = "suru-plus";
  name = pname;
  version = "2019-07-24";

  src = fetchFromGitHub {
    owner = "gusbemacbe";
    repo = pname;
    rev = "9bd895f324051ed9ba26e5981dd995376e5e572a";
    sha256 = "bZSLdRfEUmN4+A63ZVaOaK02L85b4nscXk95EU/trF0=";
  };

  nativeBuildInputs = [ 
    gtk3 
    jdupes
    wget
  ];

  installPhase = ''
    ./install.sh --dest $out/share/icons \
    --name suru-plus  '';

  postFixup = ''
    for theme in $out/share/icons/*; do
      gtk-update-icon-cache $theme
    done
  '';

  # meta = with lib; {
  #   description = "A cyberpunkish, elegant, futuristic, macOS-like, Papirus-like and modern Suru icons based on Suru Icons by Sam Hewitt";
  #   #homepage = https://drasite.com/flat-remix;
  #   license = with licenses; [ gpl3 ];
  #   platforms = platforms.all;
  #   maintainers = with maintainers; [ gusbemacbe ];
  # };
}