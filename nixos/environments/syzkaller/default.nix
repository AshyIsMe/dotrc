with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "env";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    # stdenv
    gcc7
    openssl
    openssl.dev
    bison
    flex
    pkgconfig
    automake
    libelf
    glibc.out
    glibc.static
    git

    debootstrap
    go

    linux.nativeBuildInputs
    linux.moduleBuildDependencies

  ];
  hardeningDisable = [ "all" ];
}
