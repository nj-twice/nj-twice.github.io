{
self,
stdenv,
typst,
# just
}:

stdenv.mkDerivation rec {
  name = "nj_website";
  version = "0.1";
  src = self;
  nativeBuildInputs = [
    # just
    typst
  ];
  buildPhase = ''
    cd typst/
    typst c index.typ --format html --features html
    cd ..
  '';
  installPhase = ''
    mkdir -p $out/
    mv typst/*.html $out/
  '';
}
