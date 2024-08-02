[
  (final: prev: {
    darwin-nerd-fonts = final.callPackage ../pkgs/darwin/nerd-fonts {};
    sketchybar-lua = final.callPackage ../pkgs/visual/sketchybar-lua {
      inherit (final.darwin.apple_sdk.frameworks) CoreFoundation;
    };
    sketchyvim = final.callPackage ../pkgs/visual/sketchyvim {
      inherit (final.darwin.apple_sdk.frameworks) Carbon Cocoa CoreText;
    };
    v2raya = final.callPackage ../pkgs/wired/v2raya {};
  })
]
