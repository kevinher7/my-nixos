{ pkgs, ... }:
{
  config = {
    environment.systemPackages =
      with pkgs; [
        ghostty
        rofi

        xwallpaper
        xsecurelock
        pavucontrol
      ];
  };
}
