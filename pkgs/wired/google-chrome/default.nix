{ lib
, buildDmgAppImpure
, fetchurl
}:
let
  google-chrome = fetchurl {
    url = "https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg";
    sha256 = "sha256-yXNycVHIlXntkP020M/hxa/FY5VIo0pqHf17RIRooWs=";
  };
in
buildDmgAppImpure google-chrome "Google Chrome" {
  pname = "google-chrome";
  version = "126.0.6478.62";

  meta = with lib; {
    description = "The official web browser from Google";
    homepage = "https://www.google.com/intl/en/chrome/";
    license = licenses.unfree;
    platforms = platforms.darwin;
  };
}

