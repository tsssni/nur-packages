{
  description = "tsssni's NUR repository";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in {
      overlays = import ./overlays;
      packages = forAllSystems (
        system: import ./pkgs {inherit nixpkgs system;}
      );
      modules = ./modules;
      lib = import ./lib {lib = nixpkgs.lib;};
    };
}
