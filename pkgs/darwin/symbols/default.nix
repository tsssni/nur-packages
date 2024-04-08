{ lib
, stdenvNoCC
, fetchurl
, p7zip
, darwin-fonts
}:
stdenvNoCC.mkDerivation rec {
  pname = "darwin-symbols";
  version = "5.1";

  sf-symbols = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Symbols-5.1.dmg";
    sha256 = "sha256-7HIOlAYpQHzyoMhW2Jtwq2Tor8ojs4mTHjUjfMKKMM4=";
  };

  nativeBuildInputs = [ p7zip ];
  buildInputs = [ darwin-fonts ];
  phases = [ "installPhase" ];

  installPhase = ''
    runHook preInstall

    7z x ${sf-symbols}
    cd SFSymbols
    7z x 'SF Symbols.pkg'
    7z x 'Payload~'
    mkdir -p $out/Applications
    chmod -R 755 'Applications/SF Symbols.app'
    mv 'Applications/SF Symbols.app' $out/Applications
    cd ..

    runHook postInstall
  '';

  meta = with lib; {
    description = "Darwin symbols";
    homepage = "https://developer.apple.com/sf-symbols/";
    license = licenses.unfree;
    platforms = platforms.darwin;
  };
}

