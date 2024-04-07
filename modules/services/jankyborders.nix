{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.jankyborders;
  args = mkIf (cfg.config != {}) 
    (concatStringsSep " " (mapAttrsToList
      (k: v: "${k}=${toString v}")
    cfg.config));
in

{
  options = with types; {
    services.jankyborders = {
      enable = mkEnableOption "jankyborders"; 
      package = mkPackageOption pkgs "jankyborders" {};
      config = mkOption {
        type = attrs;
        default = {};
        example = literalExpression ''
          {
            style = "round";
            active_color = "0xffff0000";
            width = 5.0;
          }
        '';
        description = lib.mdDoc ''
          Key/Value pairs to pass arguments to borders.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];

    launchd.user.agents.jankyborders = {
      serviceConfig = {
        ProgramArguments = [ "${cfg.package}/bin/borders" args];
        KeepAlive = true;
        RunAtLoad = true;
      };
    };
  };
}
