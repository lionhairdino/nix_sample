{

  inputs.nixpkgs.url = github:nixos/nixpkgs/nixos-24.11;


  # TODO: Use `flake-parts` or `nix-utils`
  # 1. override:  "self: super: { ... }"
  # 2. module: ...
  # haskell.nix sucks !!!
  # horizon haskell ??
  # nix + bazel (cabal XXX) -- bazel rule (TWEAG)
  # nix + buck2 (!!!)

  outputs = inputs:
  let
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowBroken = true;
    };

    inherit (pkgs) lib;

    hlib = pkgs.haskell.lib;

    foo = pkgs.callPackage ./simplist_libfoo/libfoo/libfoo.nix {};

    haskell-override = hself: hsuper: {
      simplist_zlib = hself.callCabal2nix "simplist_zlib" ./simplist_zlib {};
      simplist_libfoo = hself.callCabal2nix "simplist_libfoo" ./simplist_libfoo {
        inherit foo;
      };
    };

    #haskell-override = hlib.packageSourceOverrides {
    #  simplist_libfoo = ./simplist_libfoo;
    #};

    #haskell-override =  hlib.packageSourceOverrides (lib.filesystem.haskellPathsInDir ./.);

    hpkgs = pkgs.haskellPackages.extend haskell-override;

    dev-shell = hpkgs.shellFor {
      packages = hp: with hp; [ simplist_libfoo simplist_zlib];
    };

  in
    {

      inherit pkgs hpkgs foo;

      packages.${system} = {
       #inherit (hpkgs) simplist simplist_zlib simplist_libfoo;
       inherit foo;
       inherit (hpkgs) simplist_libfoo;
       default = hpkgs.simplist;
       
     };

     devShells.${system}.default = dev-shell;

    };

}
