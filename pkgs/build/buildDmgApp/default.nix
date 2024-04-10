{ lib
, stdenvNoCC
, undmg
}: 
app: 
args@{
  ...
}:
stdenvNoCC.mkDerivation (args // {
  nativeBuildInputs = [ undmg ];
  phases = [ "unpackPhase" "installPhase" ];
  src = app;
  sourceRoot = ".";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/Applications
    cp -r *.app $out/Applications

    runHook postInstall
  '';
})
