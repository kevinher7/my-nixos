{
  programs.nixvim = {
    plugins = {
      gitsigns = {
        enable = true;
        settings = {
          signs = {
            add.text = "+";
            change.text = "~";
            changedelete.text = "~";
            delete.text = "_";
            topdelete.text = "‾";
            untracked.text = "┆";
          };
        };
      };
      # TODO: Implement keymaps for in-editor git tracking
    };
  };
}
