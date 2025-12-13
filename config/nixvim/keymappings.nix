{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;
    };

    keymaps = [
      {
        action = "<cmd>nohlsearch<CR>";
        key = "<Esc>";
        options =
          {
            silent = true;
            noremap = true;
            desc = "Clean hlsearch";
          };
      }
      # Telescope
      {
        action = ":Telescope live_grep<CR>";
        key = "<leader>sg";
        options = {
          silent = true;
          noremap = true;
          desc = "[S]earch [g]rep";
        };
      }
      {
        action = ":Telescope find_files<CR>";
        key = "<leader>sf";
        options = {
          silent = true;
          noremap = true;
          desc = "[S]earch [f]iles";
        };
      }
      {
        action = ":Telescope keymaps<CR>";
        key = "<leader>sk";
        options = {
          silent = true;
          noremap = true;
          desc = "[S]earch [k]eymaps";
        };
      }
    ];
  };
}
