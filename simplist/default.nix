let
  pkgs = import <nixpkgs> { };
  haskellPackages = pkgs.haskell.packages.ghc98;
in
  #haskellPackages.developPackage {
  haskellPackages.mkDerivation {
    root = ./.;
  }


