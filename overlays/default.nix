[
  (final: prev: {
    v2raya = final.callPackage ../pkgs/wired/v2raya {};
    darwin-fonts = final.callPackage ../pkgs/darwin/fonts {};
    darwin-nerd-fonts = final.callPackage ../pkgs/darwin/nerd-fonts {};
    darwin-symbols = final.callPackage ../pkgs/darwin/symbols {};
    wpsoffice = final.callPackage ../pkgs/office/wpsoffice {};
    dingtalk = final.callPackage ../pkgs/office/dingtalk {};
    lark = final.callPackage ../pkgs/office/lark {};
  })
]
