{ pkgs, ... }:
{
  programs.firefox.enable = true;
  programs.light.enable = true;

  programs.xss-lock = {
    enable = true;
    lockerCommand = "xsecurelock";
  };

  programs.gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
}
