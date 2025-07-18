{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
  };

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      # Systems supported
      allSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems =
        f:
        nixpkgs.lib.genAttrs allSystems (
          system:
          f {
            pkgs = import nixpkgs { inherit system; };
          }
        );

      mkPkg = pkgs: pkgs.callPackage ./Toloka2MediaServer.nix { };
    in
    {
      devShells = forAllSystems (
        { pkgs }:
        {
          default = pkgs.mkShell {
            packages = [ (mkPkg pkgs) ];
          };
        }
      );

      packages = forAllSystems (
        { pkgs }:
        {
          toloka2mediaServer = mkPkg pkgs;
        }
      );
    };
}
