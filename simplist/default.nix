{ haskell, ghc-name ? "ghc98" }:

let
  haskellPackages = haskell.packages.${ghc-name};
in
  haskellPackages.callCabal2nix "simplist" ./. {}


