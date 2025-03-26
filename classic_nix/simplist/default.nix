let
  pkgs = import <nixpkgs> { };
  #haskellPackages = pkgs.haskell.packages.ghc982;
  haskellPackages = pkgs.haskellPackages;
in
  #haskellPackages.developPackage {
  haskellPackages.mkDerivation {
    pname = "simplist";
    version = "0.1.0.0";
    license = "license";
    src = ./.;
  }


