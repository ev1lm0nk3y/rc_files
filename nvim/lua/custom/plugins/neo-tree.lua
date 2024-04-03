return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  config = function()
    require("neo-tree").setup {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
      }
    }
  end,
  keys = {
    {"<leader>B", "<cmd>Neotree buffers float toggle<cr>", desc = "Buffers" },
    {"<leader>ee", "<cmd>Neotree toggle<cr>", desc = "Neotree" },
  }
}
