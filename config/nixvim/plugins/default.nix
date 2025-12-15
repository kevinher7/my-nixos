{ pkgs, ... }: {
  imports = [
    ./telescope.nix
    ./lsp.nix
    ./treesitter.nix
    ./gitsigns.nix
    ./indent-blankline.nix
    ./typst-vim.nix
    ./blink-cmp.nix
  ];

  programs.nixvim = {
    colorschemes = {
      catppuccin = {
        enable = true;
      };
    };

    plugins = {
      transparent.enable = true;
      web-devicons.enable = true;
      none-ls.enable = true;

      guess-indent.enable = true;
      nvim-autopairs.enable = true;
      nvim-surround.enable = true;
    };
  };
}
