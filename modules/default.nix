{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.lockscreen;
in
{
  options.modules.lockscreen = {
    enable = mkEnableOption "i3lock-color lockscreen";

    color = mkOption {
      type = types.str;
      default = "2e3440";
      description = "Background color for i3lock";
    };

    timeColor = mkOption {
      type = types.str;
      default = "d8dee9";
      description = "Time text color";
    };

    dateColor = mkOption {
      type = types.str;
      default = "d8dee9";
      description = "Date text color";
    };

    showClock = mkOption {
      type = types.bool;
      default = true;
      description = "Show clock on lock screen";
    };
  };

  config = mkIf cfg.enable {
    programs.i3lock.enable = true;

    security.pam.services.i3lock-color.enable = true;

    services = {
      logind.powerKey = "suspend";

      xserver.displayManager.sessionCommands = ''
        ${pkgs.xss-lock}/bin/xss-lock -- ${pkgs.i3lock-color}/bin/i3lock-color \
          --color=${cfg.color} \
          ${optionalString cfg.showClock "--clock"} \
          --time-color=${cfg.timeColor} \
          --date-color=${cfg.dateColor} &
      '';
    };
  };
}
