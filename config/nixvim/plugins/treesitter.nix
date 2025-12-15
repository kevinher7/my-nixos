{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;

        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          nix
          query
          yaml

          python
          c

          typst
        ];

        settings = {
          highlight.enable = true;
        };
      };
    };
  };
}
