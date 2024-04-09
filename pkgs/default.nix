{ nixpkgs, system }:
let 
pkgs = import nixpkgs {
  overlays = import ../overlays;
  inherit system;
};
in with pkgs; {
  inherit 
    darwin-fonts
    darwin-nerd-fonts
    darwin-symbols
    v2raya 
    google-chrome
    wpsoffice
    dingtalk
    lark
  ;
}
