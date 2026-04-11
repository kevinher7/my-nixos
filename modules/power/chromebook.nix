{ config, lib, pkgs, username, ... }:
let
  cfg = config.myModules.power;
in
{
  config = lib.mkIf (cfg.enable && cfg.profile == "chromebook") {
    services.logind = {
      powerKey = "suspend";
      lidSwitch = "suspend-then-hibernate";

      extraConfig = ''
        IdleAction=suspend-then-hibernate
        IdleActionSec=10m
      '';
    };

    systemd = {
      sleep.extraConfig = ''
        HibernateDelaySec=180
      '';

      services.lock-after-resume = {
        description = "Lock screen after resume";
        wantedBy = [ "suspend.target" ];
        after = [ "suspend.target" "systemd-suspend.service" ];

        serviceConfig = {
          Type = "oneshot";
          User = username;

          ExecStart = "${pkgs.betterlockscreen}/bin/betterlockscreen -l dimblur";
        };
      };
    };

    services.auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "auto";
          energy_performance_preference = "power";
        };

        charger = {
          governor = "performance";
          turbo = "auto";
          energy_performance_preference = "balance_performance";
        };
      };
    };
  };
}
