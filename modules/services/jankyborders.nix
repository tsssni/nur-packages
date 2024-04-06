{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.jankyborders;
in

{
  options = with types; {
    services.jankyborders = {
      enable = mkEnableOption "jankyborders"; 
      package = mkPackageOption pkgs "jankyborders" {};
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];

    launchd.user.agents.jankyborders = {
      serviceConfig = {
        ProgramArguments = [ "${cfg.package}/bin/borders" ];
        KeepAlive = true;
        RunAtLoad = true;
      };
    };
  };
}
