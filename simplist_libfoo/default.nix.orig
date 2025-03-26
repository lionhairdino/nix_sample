{ pkgs ? import <nixpkgs> {} }:

let
  haskellPackages = pkgs.haskellPackages;
  ghc = haskellPackages.ghc;
  cabal-install = haskellPackages.cabal-install;

  libfooDefs = import ./libfoo/libfoo.nix { inherit pkgs; };
  libfoo = libfooDefs.libfoo;
  libfooPkgConfig = libfooDefs.libfooPkgConfig;

in {
  package = builtins.trace "${libfooPkgConfig}" haskellPackages.mkDerivation rec {
    pname = "simplist_libfoo";
    version = "0.1.0.0";
    src = ./.;
    license = "License";
    preCompileBuildDriver = ''
      export PKG_CONFIG_PATH=${libfooPkgConfig}:$PKG_CONFIG_PATH
    '';
    buildTools = [ pkgs.pkg-config ];
#    pkg-configDepends = [ libfoo ]; TODO 용도 확인하기
  };
}
