{ 
  nixpkgs
, system
}:
let 
pkgs = import nixpkgs {
  overlays = import ../overlays;
  inherit system;
};
in with pkgs; {
  inherit 
    darwin-fonts
    darwin-nerd-fonts
    google-chrome
    wpsoffice
    dingtalk
    lark
    sketchybar-lua
    sketchyvim
    v2raya 
  ;
}
