{ config, lib, pkgs, ... }:
let
  lockImage = ../walls/girl-reading-book.png;
  lockImageTarget = "${config.home.homeDirectory}/.config/betterlockscreen/lock.png";
  betterlockscreenCmd = "${pkgs.betterlockscreen}/bin/betterlockscreen";
in
{
  home.packages = with pkgs; [
    betterlockscreen
    xss-lock
  ];

  home.file.".config/betterlockscreen/lock.png".source = lockImage;

  services.betterlockscreen = {
    enable = true;
    arguments = [ "-u" lockImageTarget ];
  };

  services.screen-locker = {
    enable = true;
    # xss-lock.enable = true;
    lockCmd = lib.mkForce "${betterlockscreenCmd} -l dimblur";
    inactiveInterval = lib.mkForce 3;
  };

  # Rebuild the betterlockscreen cache automatically whenever HM switches.
  home.activation.betterlockscreenCache =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      run ${betterlockscreenCmd} -u "${lockImageTarget}"
    '';
}
