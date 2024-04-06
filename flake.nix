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
    in
    {
      packages = forAllSystems (system: import ./pkgs {pkgs = import nixpkgs {inherit system;};});
      lib = import ./lib {lib = nixpkgs.lib;};
      modules = ./modules;
    };
}
