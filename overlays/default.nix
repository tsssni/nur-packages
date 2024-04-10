[
  (final: prev: {
    buildDmgApp = final.callPackage ../pkgs/build/buildDmgApp {};
    buildDmgAppImpure = final.callPackage ../pkgs/build/buildDmgAppImpure {};
    darwin-fonts = final.callPackage ../pkgs/darwin/fonts {};
    darwin-nerd-fonts = final.callPackage ../pkgs/darwin/nerd-fonts {};
    darwin-symbols = final.callPackage ../pkgs/darwin/symbols {};
    dingtalk = final.callPackage ../pkgs/office/dingtalk {};
    google-chrome = final.callPackage ../pkgs/wired/google-chrome {};
    lark = final.callPackage ../pkgs/office/lark {};
    wpsoffice = final.callPackage ../pkgs/office/wpsoffice {};
    sketchyvim = final.callPackage ../pkgs/visual/sketchyvim {
      inherit (final.darwin.apple_sdk.impure-deps.frameworks) Carbon Cocoa CoreText;
    };
    v2raya = final.callPackage ../pkgs/wired/v2raya {};
  })
]
