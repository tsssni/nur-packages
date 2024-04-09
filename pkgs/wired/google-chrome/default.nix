{ lib
, buildDmgAppImpure
, fetchurl
}:
let
  google-chrome = fetchurl {
    url = "https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg";
    sha256 = "sha256-/pn2rVWM+e7PYBMddcVNb46lEmyyac1vMmXAz4AohfE=";
  };
in
buildDmgAppImpure google-chrome "Google Chrome" {
  pname = "google-chrome";
  version = "latest";

  meta = with lib; {
    description = "The official web browser from Google";
    homepage = "https://www.google.com/intl/en/chrome/://larksuite.com";
    license = licenses.unfree;
    platforms = platforms.darwin;
  };
}

