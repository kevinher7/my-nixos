{config, pkgs, ... }:

let 
  nixvim = import (
    builtins.fetchGit {
      url = "https://github.com/nix-community/nixvim";
      ref = "main";
    }
  );
in
{
  imports = [
    nixvim.homeModules.nixvim
    /home/kevin/home-manager-dotfiles/nixvim/keymappings.nix
    /home/kevin/home-manager-dotfiles/nixvim/options.nix
    /home/kevin/home-manager-dotfiles/nixvim/plugins
  ];

  home.stateVersion = "25.05";
  home.username = "kevin";
  home.homeDirectory = "/home/kevin";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.packages = with pkgs; [
    # Bare Minimum
    vim
    wget
    neovim
    ghostty
    pavucontrol
    btop
    xwallpaper
    bat
    pcmanfm
    pfetch
    rofi

    # User Basics
    tree
    zathura
    unzip

    # Developer Basics
    git
    curl
    gcc

    # Neovim Related
    ripgrep
    nixpkgs-fmt
    nixpkgs-review
    ruff
  ];

  programs = {
    git = {
      enable = true;
      userName = "Kevin Hernandez";
      userEmail = "kevinhernem@gmail.com";

      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    nixvim = {
      enable = true;
      defaultEditor = true;

      luaLoader.enable = true;
    };

    bash = {
      enable = true;
        shellAliases = {
          btw = "echo i use nixos btw";
          nrs = "sudo nixos-rebuild switch";
          za = "zathura --fork";
        };

        initExtra = ''
          export PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'
          export PS1='\[\e[38;5;93m\]\u\[\e[0m\] in \[\e[38;5;251m\]\w\[\e[0m\] [\[\e[38;5;196m\]${"$"}{PS1_CMD1}\[\e[0m\]] ${"$"} '
        '';
    };

    ghostty = {
      enable = true;
      settings = {
        theme = "Flatland";
        font-family = "JetBrainsMono";
        background-opacity = 0.9;
        keybind = [
          "performable:ctrl+c=copy_to_clipboard"
          "performable:ctrl+v=paste_from_clipboard"
        ];
        window-decoration = false;
        window-padding-balance = true;
        window-padding-y = 0;
        window-padding-x = 0;
        confirm-close-surface = false;
      };
    };
  };

  home.file.".config/qtile".source = "/home/kevin/home-manager-dotfiles/qtile";
}
