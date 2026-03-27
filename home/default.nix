{ lib, pkgs, desktop, ... }:
let
  desktopSession =
    if desktop == "qtile" then
      [ ./desktop/qtile ]
    else if desktop == "niri" then
      [ ./desktops/niri ]
    else
      throw ''
        home/default.nix: desktop must be either "qtile" or "niri",
        got "${desktop}"
      '';
in
{
  imports = [
    ./git.nix
    ./bash.nix
    ./ghostty.nix
    ./stylix.nix
    ./nixvim
    ./programs
    ./rquickshare.nix
    ./betterlockscreen.nix
  ]
  ++ desktopSession;

  programs.home-manager.enable = true;

  home = {
    # TODO: Modularize the username?
    username = "kevin";
    homeDirectory = lib.mkForce "/home/kevin";
    stateVersion = "25.05";

    packages = with pkgs; [
      curl
      unzip
      bitwarden-cli
      playerctl
    ];
  };
}
