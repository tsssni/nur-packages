{ lib
, stdenvNoCC
, fetchurl
, undmg
}:
stdenvNoCC.mkDerivation rec {
  pname = "dingtalk";
  version = "7.5.11";

  dingtalk = fetchurl {
    url = "https://dtapp-pub.dingtalk.com/dingtalk-desktop/mac_dmg/Release/M1-Beta/DingTalk_v7.5.11_35928001_universal.dmg";
    sha256 = "sha256-YFk53gt/YXkB3pALcW6KtxrteBALSQi6AF1AVIlIh/c=";
  };

  nativeBuildInputs = [ undmg ];
  phases = [ "installPhase" ];

  installPhase = ''
    runHook preInstall

    undmg ${dingtalk}
    mkdir -p $out/Applications
    cp -r 'DingTalk.app' $out/Applications

    runHook postInstall
  '';

  meta = with lib; {
    description = "DingTalk, an inovative teamwork app by Alibaba Group.";
    homepage = "https://dingtalk.com";
    license = licenses.unfree;
    platforms = platforms.darwin;
  };
}

