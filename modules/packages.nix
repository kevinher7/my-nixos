{ pkgs, ... }:
{
  users.users.kevin = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];
    packages = with pkgs; [ tree ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    ghostty
    pavucontrol
    btop
    xwallpaper
    pfetch
    pcmanfm
    rofi
    xsecurelock
    papirus-icon-theme
  ];

  environment.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
  };
}
