{ lib
, stdenv
, fetchurl
}:
stdenv.mkDerivation rec {
  pname = "v2raya";
  version = "2.2.5.1";
  src = fetchurl {
    url = "https://github.com/v2rayA/v2rayA/releases/download/v2.2.5.1/v2raya_darwin_arm64_2.2.5.1";
    sha256 = "sha256-xh1HFR19lO0M1LoXt/GT0nEvnEB1hNOYiH42rzp9hCE=";
    executable = true;
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin
    cp ${src} $out/bin/v2raya
  '';

  meta = with lib; {
    description = "A Linux web GUI client of Project V which supports V2Ray, Xray, SS, SSR, Trojan and Pingtunnel";
    homepage = "https://github.com/v2rayA/v2rayA";
    mainProgram = "v2raya";
    license = licenses.agpl3Only;
    platforms = platforms.darwin;
  };
}

