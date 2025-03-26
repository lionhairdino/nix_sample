{ stdenv, lib }:

stdenv.mkDerivation {
    pname = "foo";
    version = "0.1";
    src = ./.;
    # 닉스가 기본 동작으로 $out 디렉토리를 만들고, make install을 호출하는데,
    # installPhase를 지정하면, 기본 동작을 하지 않는다.

    dontConfigure = true;

    buildPhase = ''
      make
    '';

    installPhase = ''
      mkdir -p $out/lib $out/include
      cp libfoo.so $out/lib/
      cp foo.h $out/include

      mkdir -p $out/lib/pkgconfig

      cat <<EOF > $out/lib/pkgconfig/foo.pc
      prefix = ${placeholder "out"} 
      includedir = ${placeholder "out"}/include
      libdir = ${placeholder "out"}/lib
 
      Name: foo
      Description: foo - C library
      Version: 0.1
      Cflags: -I${placeholder "out"}/include
      Libs: -L${placeholder "out"}/lib -lfoo
      
      EOF
    '';

    meta = {
      description = "foo - C library";
      platforms = lib.platforms.all;
    };
    # libfoo는 $out 풀경로를 가진다.
  }
