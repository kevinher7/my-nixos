{ ... }:
{
  imports = [
    ./stylix.nix
    ./nixvim
    ./qtile
    ./programs
  ];

  # TODO: Modularize the username?
  home.username = "kevin";
  home.homeDirectory = "/home/kevin";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
