{ pkgs ? import <nixpkgs> {} }:

let # 편의를 위한 바인딩들
  haskellPackages = pkgs.haskellPackages;
  ghc = haskellPackages.ghc;
  cabal-install = haskellPackages.cabal-install;
in
{
  devShell = pkgs.mkShell {
    name = "simplist_zlib-0.1.0.0";
    buildInputs = [ pkgs.haskellPackages.ghc pkgs.haskellPackages.cabal-install pkgs.zlib.dev ];
    shellHook = ''
       export LD_LIBRARY_PATH="${pkgs.zlib.dev}/lib:$LD_LIBRARY_PATH"
    '';
  };

  package = haskellPackages.mkDerivation rec{
    pname = "simplist_zlib";
    version = "0.1.0.0";
    src = ./.;
    license = "";
    configureFlags = [ "--extra-include-dirs=${pkgs.zlib.dev}/include"
                       "--extra-lib-dirs=${pkgs.zlib.dev}/lib"
                     ];
    extraLibraries = [ pkgs.zlib.dev ];
  };
}  
