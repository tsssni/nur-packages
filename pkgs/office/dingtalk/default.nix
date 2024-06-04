{ lib
, buildDmgApp
, fetchurl
}:
let
  pname = "dingtalk";
  version = "7.5.30,37289100";

  dingtalk = let
    versionSplit = lib.strings.splitString "," version;
    mainVersion = builtins.elemAt versionSplit 0;
    patch = builtins.elemAt versionSplit 1;
  in fetchurl {
    url = "https://dtapp-pub.dingtalk.com/dingtalk-desktop/mac_dmg/Release/M1-Beta/DingTalk_v${mainVersion}_${patch}_universal.dmg";
    sha256 = "sha256-wefmS0+iAAwAYwO6BkPZKRQlRayqf0+7fWw1IPvGQPQ=";
  };
in
buildDmgApp dingtalk {
  inherit pname version;

  meta = with lib; {
    description = "DingTalk, an inovative teamwork app by Alibaba Group";
    homepage = "https://dingtalk.com";
    license = licenses.unfree;
    platforms = platforms.darwin;
  };
}

