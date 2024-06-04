{ lib
, buildDmgAppImpure
, fetchurl
}:
let
  google-chrome = fetchurl {
    url = "https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg";
    sha256 = "sha256-8OlzATGTC8t/dflmTFW2iU3rFgZQFP9xo2DYDQVlUFc=";
  };
in
buildDmgAppImpure google-chrome "Google Chrome" {
  pname = "google-chrome";
  version = "125.0.6422.142";

  meta = with lib; {
    description = "The official web browser from Google";
    homepage = "https://www.google.com/intl/en/chrome/";
    license = licenses.unfree;
    platforms = platforms.darwin;
  };
}

