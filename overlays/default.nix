[
  (final: prev: {
    buildDmgApp = final.callPackage ../pkgs/build-support/buildDmgApp {};
    buildDmgAppImpure = final.callPackage ../pkgs/build-support/buildDmgAppImpure {};
    darwin-fonts = final.callPackage ../pkgs/darwin/fonts {};
    darwin-nerd-fonts = final.callPackage ../pkgs/darwin/nerd-fonts {};
    darwin-symbols = final.callPackage ../pkgs/darwin/symbols {};
    v2raya = final.callPackage ../pkgs/wired/v2raya {};
    google-chrome = final.callPackage ../pkgs/wired/google-chrome {};
    wpsoffice = final.callPackage ../pkgs/office/wpsoffice {};
    dingtalk = final.callPackage ../pkgs/office/dingtalk {};
    lark = final.callPackage ../pkgs/office/lark {};
  })
]
