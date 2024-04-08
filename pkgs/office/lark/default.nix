{ lib
, stdenvNoCC
, fetchurl
, undmg
}:
stdenvNoCC.mkDerivation rec {
  pname = "lark";
  version = "7.14.5";

  lark = fetchurl {
    url = "https://sf16-va.larksuitecdn.com/obj/lark-artifact-storage/94173f78/Lark-darwin_arm64-${version}-signed.dmg";
    sha256 = "sha256-UKnadn9CvxT9qtBaVYs3PLwHBTTNQ2/eswLYyiJACI8=";
  };

  nativeBuildInputs = [ undmg ];
  phases = [ "installPhase" ];

  installPhase = ''
    runHook preInstall

    undmg ${lark}
    mkdir -p $out/Applications
    cp -r LarkSuite.app $out/Applications

    runHook postInstall
  '';

  meta = with lib; {
    description = "Lark takes the hassle out of collaboration, so you can focus on what truly matters.";
    homepage = "https://larksuite.com";
    license = licenses.unfree;
    platforms = [ "aarch64-darwin" ];
  };
}

