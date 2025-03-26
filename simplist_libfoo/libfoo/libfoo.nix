{ pkgs ? import <nixpkgs> {} }:

let
  libfoo = pkgs.stdenv.mkDerivation rec {
    pname = "foo";
    version = "0.1";
    src = ./.;
    buildInputs = [ pkgs.gcc ];
    buildPhase = ''
      make
    '';
    # 닉스가 기본 동작으로 $out 디렉토리를 만들고, make install을 호출하는데,
    # installPhase를 지정하면, 기본 동작을 하지 않는다.
    installPhase = ''
      mkdir -p $out/lib $out/include
      cp libfoo.so $out/lib/
      cp foo.h $out/include
    '';
    meta = {
      description = "foo - C library";
      platforms = pkgs.lib.platforms.all;
    };
    # libfoo는 $out 풀경로를 가진다.
  };

  # pkg-config에 등록용 .pc 파일
  libfooPkgConfig = pkgs.writeTextDir "foo.pc" ''
    prefix = ${libfoo}
    includedir = ${libfoo}/include
    libdir = ${libfoo}/lib

    Name: foo
    Description: foo - C library
    Version: 0.1
    Cflags: -I${libfoo}/include
    Libs: -L${libfoo}/lib -lfoo
  '';
  # 
in {
  inherit libfoo libfooPkgConfig;
}
