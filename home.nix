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
    targets = {
      rofi.enable = true;
      ghostty.enable = true;
      btop.enable = true;
      zathura.enable = true;
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
      extraConfig =
        let
          # Access the Stylix colors from the global config
          colors = config.lib.stylix.colors;
        in
        ''
          # Completion widget
          c.colors.completion.fg = '#${colors.base05}'
          c.colors.completion.even.bg = '#${colors.base00}'
          c.colors.completion.odd.bg = '#${colors.base01}'
          c.colors.completion.category.fg = '#${colors.base0D}'
          c.colors.completion.category.bg = '#${colors.base00}'
          c.colors.completion.category.border.top = '#${colors.base00}'
          c.colors.completion.category.border.bottom = '#${colors.base00}'
          c.colors.completion.item.selected.fg = '#${colors.base01}'
          c.colors.completion.item.selected.bg = '#${colors.base0A}'
          c.colors.completion.item.selected.border.top = '#${colors.base0A}'
          c.colors.completion.item.selected.border.bottom = '#${colors.base0A}'
          c.colors.completion.match.fg = '#${colors.base0B}'
          c.colors.completion.scrollbar.fg = '#${colors.base05}'
          c.colors.completion.scrollbar.bg = '#${colors.base00}'

          # Downloads
          c.colors.downloads.bar.bg = '#${colors.base00}'
          c.colors.downloads.start.fg = '#${colors.base00}'
          c.colors.downloads.start.bg = '#${colors.base0D}'
          c.colors.downloads.stop.fg = '#${colors.base00}'
          c.colors.downloads.stop.bg = '#${colors.base0C}'
          c.colors.downloads.error.fg = '#${colors.base08}'

          # Statusbar
          c.colors.statusbar.normal.fg = '#${colors.base05}'
          c.colors.statusbar.normal.bg = '#${colors.base00}'
          c.colors.statusbar.insert.fg = '#${colors.base00}'
          c.colors.statusbar.insert.bg = '#${colors.base0B}'
          c.colors.statusbar.passthrough.fg = '#${colors.base00}'
          c.colors.statusbar.passthrough.bg = '#${colors.base0C}'
          c.colors.statusbar.command.fg = '#${colors.base05}'
          c.colors.statusbar.command.bg = '#${colors.base00}'
          c.colors.statusbar.url.fg = '#${colors.base05}'
          c.colors.statusbar.url.warn.fg = '#${colors.base0E}'
          c.colors.statusbar.url.error.fg = '#${colors.base08}'
          c.colors.statusbar.url.hover.fg = '#${colors.base05}'
          c.colors.statusbar.url.success.http.fg = '#${colors.base0C}'
          c.colors.statusbar.url.success.https.fg = '#${colors.base0B}'

          # Tabs
          c.colors.tabs.bar.bg = '#${colors.base00}'
          c.colors.tabs.indicator.start = '#${colors.base0D}'
          c.colors.tabs.indicator.stop = '#${colors.base0C}'
          c.colors.tabs.indicator.error = '#${colors.base08}'
          c.colors.tabs.odd.fg = '#${colors.base05}'
          c.colors.tabs.odd.bg = '#${colors.base01}'
          c.colors.tabs.even.fg = '#${colors.base05}'
          c.colors.tabs.even.bg = '#${colors.base00}'
          c.colors.tabs.selected.odd.fg = '#${colors.base00}'
          c.colors.tabs.selected.odd.bg = '#${colors.base05}'
          c.colors.tabs.selected.even.fg = '#${colors.base00}'
          c.colors.tabs.selected.even.bg = '#${colors.base05}'
          c.colors.tabs.pinned.odd.fg = '#${colors.base05}'
          c.colors.tabs.pinned.odd.bg = '#${colors.base0B}'
          c.colors.tabs.pinned.even.fg = '#${colors.base05}'
          c.colors.tabs.pinned.even.bg = '#${colors.base0C}'
        '';
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
  xdg.configFile."qutebrowser/config.py" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/kevin/nixos-config/config/qutebrowser/config.py";
  };
  # xdg.configFile."rquickshare" = {
  #   source = config.lib.file.mkOutOfStoreSymlink "/home/kevin/nixos-config/config/rquickshare";
  #   recursive = true;
  # };

  # Does not use ~/.config
  home.file.".local/share/dev.mandre.rquickshare" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/kevin/nixos-config/config/rquickshare";
    recursive = true;
  };

  services.dunst.enable = true;
}
