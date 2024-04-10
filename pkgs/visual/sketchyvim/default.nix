{
  lib
, stdenv
, fetchurl
, fetchFromGitHub
, Carbon
, Cocoa
, CoreText
, ncurses
, iconv
}:
stdenv.mkDerivation rec {
  pname = "sketchyvim";
  version = "1.0.11";

  # svim could not been built with sdk provided by nix, so use binary version.
  sketchyvim = fetchurl {
    url = "https://github.com/FelixKratz/SketchyVim/releases/download/v${version}/bundle_${version}.tgz";
    sha256 = "sha256-4lh81HaqlYNLHhYm39BorER1SRJZewmEzEN5a7+ixMY=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    tar -xvf ${sketchyvim}
    mkdir -p $out/bin
    chmod 755 bundle/svim
    cp bundle/svim $out/bin
  '';

  meta = with lib; {
    description = "Adds all vim moves and modes to macOS text fields";
    homepage = "https://github.com/FelixKratz/SketchyVim";
    license = licenses.gpl3;
    platforms = platforms.darwin;
  };
}
