{ lib
, stdenvNoCC
, fetchurl
, p7zip
}:
stdenvNoCC.mkDerivation rec {
  pname = "darwin-fonts";
  version = "latest";

  sf-pro = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg";
    sha256 = "sha256-B8xljBAqOoRFXvSOkOKDDWeYUebtMmQLJ8lF05iFnXk=";
  };

  sf-compact = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg";
    sha256 = "sha256-L4oLQ34Epw1/wLehU9sXQwUe/LaeKjHRxQAF6u2pfTo=";
  };

  sf-mono = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg";
    sha256 = "sha256-Uarx1TKO7g5yVBXAx6Yki065rz/wRuYiHPzzi6cTTl8=";
  };

  ny = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/NY.dmg";
    sha256 = "sha256-yYyqkox2x9nQ842laXCqA3UwOpUGyIfUuprX975OsLA=";
  };

  nativeBuildInputs = [ p7zip ];
  phases = [ "installPhase" ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/fontfiles

    7z x ${sf-pro}
    cd SFProFonts
    7z x 'SF Pro Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $out/fontfiles
    cd ..

    7z x ${sf-mono}
    cd SFMonoFonts
    7z x 'SF Mono Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $out/fontfiles
    cd ..

    7z x ${sf-compact}
    cd SFCompactFonts
    7z x 'SF Compact Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $out/fontfiles
    cd ..

    7z x ${ny}
    cd NYFonts
    7z x 'NY Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $out/fontfiles
    cd ..

    mkdir -p $out/share/fonts/opentype/darwin-fonts $out/share/fonts/truetype/darwin-fonts
    mv $out/fontfiles/*.otf $out/share/fonts/opentype/darwin-fonts
    mv $out/fontfiles/*.ttf $out/share/fonts/truetype/darwin-fonts
    rm -rf $out/fontfiles

    runHook postInstall
  '';

  meta = with lib; {
    description = "Darwin fonts";
    homepage = "https://developer.apple.com/fonts/";
    license = licenses.unfree;
    platforms = platforms.all;
  };
}

