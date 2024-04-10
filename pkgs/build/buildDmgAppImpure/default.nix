{ lib
, stdenvNoCC
}: 
app: 
volume:
args@{
  ...
}:
stdenvNoCC.mkDerivation (args // {
  phases = [ "installPhase" ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    
    /usr/bin/hdiutil mount ${app}
    mkdir -p $out/Applications
    cp -r '/Volumes/${volume}'/*.app $out/Applications
    # unmount manually due to permission

    runHook postInstall
  '';
})
