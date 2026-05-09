{
self,
stdenv,
}:

stdenv.mkDerivation rec {
  name = "nj_website";
  version = "0.1";
  src = self;
  nativeBuildInputs = [
  ];
  installPhase = ''
    mkdir -p $out/
    mv src/* $out/
  '';
}
