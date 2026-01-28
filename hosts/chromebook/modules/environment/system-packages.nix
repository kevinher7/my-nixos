{ pkgs, ... }:
{
  config = {
    environment.systemPackages =
      with pkgs; [
        xwallpaper
        xsecurelock
        pavucontrol
      ];
  };
}
