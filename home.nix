{ config, pkgs, ... }:

{
  imports = [
    ./config/nixvim/keymappings.nix
    ./config/nixvim/options.nix
    ./config/nixvim/plugins
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
    bitwarden-cli

    # Developer Basics
    git
    gh
    curl
    gcc

    # Nixvim
    ripgrep
    alejandra
    nixpkgs-fmt
    ruff
    clang-tools
  ];

  programs = {
    # Enable Home Manager to manage the Home Directory
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "Kevin Hernandez";
      userEmail = "kevinhernem@gmail.com";

      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    bash = {
      enable = true;
      shellAliases = {
        btw = "echo i use nixos btw";
        nrs = "sudo nixos-rebuild switch --flake ~/nixos-config#beans-btw";
        cdnc = "cd ~/nixos-config";
        cdhm = "cd ~/home-manager-dotfiles";
        za = "zathura --fork";

        # Git Aliases
        gc = "git checkout";
        gcb = "git checkout -b";

        gcm = "git commit -m";

        gss = "git status -s";
        gds = "git diff --stat";
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

    nixvim = {
      enable = true;
      defaultEditor = true;

      luaLoader.enable = true;
    };

    qutebrowser = {
      enable = true;
    };

  };

  xdg.configFile."qtile" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/kevin/nixos-config/config/qtile";
    recursive = true;
  };
  xdg.configFile."qutebrowser/config.py" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/kevin/nixos-config/config/qutebrowser/config.py";
  };
}
