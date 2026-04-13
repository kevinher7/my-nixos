{ pkgs, ... }:
{
  programs = {
    light.enable = true;

    gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
  };
}
