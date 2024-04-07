{ nixpkgs, system }:
let 
pkgs = import nixpkgs {
  overlays = import ../overlays;
  inherit system;
};
in with pkgs; {
  inherit 
    v2raya 
    darwin-fonts
    darwin-nerd-fonts
  ;
}
