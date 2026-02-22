{ lib, ... }:
{
  imports = [
    ./stylix.nix
    ./nixvim
    ./qtile
    ./programs
  ];

  programs.home-manager.enable = true;

  home = {
    # TODO: Modularize the username?
    username = "kevin";
    homeDirectory = lib.mkForce "/home/kevin";
    stateVersion = "25.05";
  };
}
