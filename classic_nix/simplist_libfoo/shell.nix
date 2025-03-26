{ pkgs ? import <nixpkgs> {} }:

let
  haskellPackages = pkgs.haskellPackages;
  ghc = haskellPackages.ghc;
  cabal-install = haskellPackages.cabal-install;

  libfooDefs = import ./libfoo/libfoo.nix { inherit pkgs; };
  libfoo = libfooDefs.libfoo;
  libfooPkgConfig = libfooDefs.libfooPkgConfig;

in {
  devShell = builtins.trace "${libfooPkgConfig}" pkgs.mkShell {
    name = "simplist_libfoo";
    buildInputs = [
      ghc
      cabal-install
#      libfoo
    ];
    nativeBuildInputs = with pkgs; [
      pkg-config
    ];

    shellHook = ''
      export PKG_CONFIG_PATH=${libfooPkgConfig}:$PKG_CONFIG_PATH
    '';
  };
}
