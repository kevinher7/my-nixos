_:
{
  imports = [
    ../common/git.nix
    ../common/bash.nix
  ];

  home.username = "uribo";
  home.homeDirectory = "/home/uribo";
  home.stateVersion = "25.05";
}
