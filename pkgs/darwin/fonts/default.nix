{ lib
, stdenvNoCC
, fetchurl
, p7zip
}:
stdenvNoCC.mkDerivation rec {
  pname = "darwin-fonts";
  version = "0.0.1";

  sf-pro = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg";
    sha256 = "sha256-Mu0pmx3OWiKBmMEYLNg+u2MxFERK07BQGe3WAhEec5Q=";
  };

  sf-compact = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg";
    sha256 = "sha256-Mkf+GK4iuUhZdUdzMW0VUOmXcXcISejhMeZVm0uaRwY=";
  };

  sf-mono = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg";
    sha256 = "sha256-tZHV6g427zqYzrNf3wCwiCh5Vjo8PAai9uEvayYPsjM=";
  };

  ny = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/NY.dmg";
    sha256 = "sha256-tn1QLCSjgo5q4PwE/we80pJavr3nHVgFWrZ8cp29qBk=";
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

