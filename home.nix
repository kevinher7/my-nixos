{ config, pkgs, ... }:

{
  home.username = "kevin";
  home.homeDirectory = "/home/kevin";
  home.stateVersion = "25.05";

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
      nrs = "sudo nixos-rebuild switch";
    };

    initExtra = ''
      export PS1='\[\e[38;5;93m\]\u\[\e[0m\] in \[\e[38;5;251m\]\w\[\e[0m\] \\$ '
    '';
  };
  
  home.packages = with pkgs; [
    bat
  ];
}
