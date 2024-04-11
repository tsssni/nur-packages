{
  config
, lib
, pkgs
, ... 
}:

with lib;

let
  cfg = config.services.sketchyvim;
in

{
  options = with types; {
    services.sketchyvim = {
      enable = mkEnableOption "sketchyvim"; 
      package = mkPackageOption pkgs "sketchyvim" {};
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];

    launchd.user.agents.sketchyvim = {
      serviceConfig = {
        ProgramArguments = [ "${cfg.package}/bin/svim" ];
        KeepAlive = true;
        ProcessType = "Interactive";
      };
    };
  };
}
