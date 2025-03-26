{ pkgs ? import <nixpkgs> {} }:

let
  haskellPackages = pkgs.haskell.packages.ghc98;
in
  haskellPackages.callCabal2nix "simplist" ./. {}


