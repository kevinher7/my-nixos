{ config, pkgs, ... }:

{
  imports = [
    ./config/nixvim/keymappings.nix
    ./config/nixvim/options.nix
    ./config/nixvim/plugins

    ./config/qutebrowser/options.nix
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
    typstyle

    # QuickShare
    rquickshare
    libayatana-appindicator
  ];

  stylix = {
    enable = true;

    autoEnable = true;

    image = ./walls/girl-reading-book.png;

    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sizes = {
        applications = 12;
        desktop = 12;
        popups = 10;
      };
    };

    targets = {
      rofi.enable = true;
      ghostty.enable = true;
      btop.enable = true;
      zathura.enable = true;
      qutebrowser.enable = true;
      nixvim.enable = false;
    };
  };

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
        # font-family = "JetBrainsMono";
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

    zathura = {
      enable = true;
      options = {
        selection-clipboard = "clipboard";
      };
    };

  };

  xdg.configFile."qtile" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/kevin/nixos-config/config/qtile";
    recursive = true;
  };

  # Does not use ~/.config
  home.file.".local/share/dev.mandre.rquickshare/.settings.json".text = builtins.toJSON {
    device_name = "beans-btw";
    port = 9300;
    server_port = 9300;
    download_directory = "/home/kevin/downloads";
    light_mode = false;
    show_notifications = true;
    auto_start = false;
    autostart = false;
    startminimized = false;
    realclose = false;
    visibility = 2;
  };

  services.dunst.enable = true;
}
