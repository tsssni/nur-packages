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
    darwin-nerd-fonts
    sketchybar-lua
    sketchyvim
    v2raya 
  ;
}
