{ lib
, buildDmgApp
, fetchurl
}:
let
  pname = "lark";
  version = "7.18.8";
  lark = fetchurl {
    url = "https://sf16-va.larksuitecdn.com/obj/lark-artifact-storage/58c0089d/Lark-darwin_arm64-${version}-signed.dmg";
    sha256 = "sha256-vkork0IeVZF7IVsxRpj/t4UUIKUCIrnolickwL7npcI=";
  };
in
buildDmgApp lark {
  inherit pname version;

  meta = with lib; {
    description = "Lark takes the hassle out of collaboration, so you can focus on what truly matters";
    homepage = "https://larksuite.com";
    license = licenses.unfree;
    platforms = [ "aarch64-darwin" ];
  };
}

