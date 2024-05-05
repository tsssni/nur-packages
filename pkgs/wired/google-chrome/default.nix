{ lib
, buildDmgAppImpure
, fetchurl
}:
let
  google-chrome = fetchurl {
    url = "https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg";
    sha256 = "sha256-gbiH0TdFsodvlsHjX4v3bSPrDR2nIQ3OLCPTxW59WFQ=";
  };
in
buildDmgAppImpure google-chrome "Google Chrome" {
  pname = "google-chrome";
  version = "124.0.6367.118";

  meta = with lib; {
    description = "The official web browser from Google";
    homepage = "https://www.google.com/intl/en/chrome/";
    license = licenses.unfree;
    platforms = platforms.darwin;
  };
}

