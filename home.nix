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
      export PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'
      export PS1='\[\e[38;5;93m\]\u\[\e[0m\] in \[\e[38;5;251m\]\w\[\e[0m\] [\[\e[38;5;196m\]${"$"}{PS1_CMD1}\[\e[0m\]] ${"$"} '
    '';
  };

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Flatland";
      font-family = "JetBrainsMonoNL Nerd Font Mono";
      keybind = [
        "ctrl+c=copy_to_clipboard"
        "ctrl+v=paste_from_clipboard"
      ];
      window-decoration = false;
      window-padding-balance = true;
      window-padding-y = 0;
      window-padding-x = 0;
    };
  };
  
  home.packages = with pkgs; [
    bat
  ];
}
