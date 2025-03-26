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
    pkgs = import inputs.nixpkgs { inherit system; };
    simplist = pkgs.callPackage ./simplist {};
    dev-shells = {
     simplist = null; 
     simplist_zlib = (import ./simplist_libfoo/shell.nix { inherit pkgs; }).devShell;
     simplist_libfoo = null;
   };

  in
    {

      packages.${system} = {
       inherit simplist;
       default = simplist;
     };

     devShells.${system} = dev-shells // { default = dev-shells.simplist_zlib; };

    };

}
