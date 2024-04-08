{ lib
, stdenvNoCC
, fetchurl
, undmg
}:
stdenvNoCC.mkDerivation rec {
  pname = "wpsoffice";
  version = "3.2.0,6370";

  wpsoffice = 
  let
    versionSplit = lib.strings.splitString "," version;
    mainVersion = builtins.elemAt versionSplit 0;
    patch = builtins.elemAt versionSplit 1;
  in fetchurl {
    url = "https://wdl1.pcfg.cache.wpscdn.com/wpsdl/macwpsoffice/download/${mainVersion}.${patch}/WPSOffice_${mainVersion}(${patch}).dmg";
    sha256 = "sha256-BCY2sWCZgCzY6RRbLF2zkBxBi8dE/uD1jOAyvaCVKpU=";
  };

  nativeBuildInputs = [ undmg ];
  phases = [ "installPhase" ];

  installPhase = ''
    runHook preInstall

    undmg ${wpsoffice}
    mkdir -p $out/Applications
    cp -r wpsoffice.app $out/Applications

    runHook postInstall
  '';

  meta = with lib; {
    description = "All-in-one office suite";
    homepage = "https://www.wps.com";
    license = licenses.unfree;
    platforms = platforms.darwin;
  };
}

