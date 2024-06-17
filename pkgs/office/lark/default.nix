{ lib
, buildDmgApp
, fetchurl
}:
let
  pname = "lark";
  version = "7.19.6,75799bdd";

  lark = let
    versionSplit = lib.strings.splitString "," version;
    mainVersion = builtins.elemAt versionSplit 0;
    patch = builtins.elemAt versionSplit 1;
  in fetchurl {
    url = "https://sf16-va.larksuitecdn.com/obj/lark-artifact-storage/${patch}/Lark-darwin_arm64-${mainVersion}-signed.dmg";
    sha256 = "sha256-cUxTT1cAKSrQswL9gUQC8E3Q0vlMOo5PMMCt5lJVJ5Q=";
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

