return {
  "christoomey/vim-tmux-navigator",

  -- Getting autocomplete and language servers ready to be used.
  -- The language and cmp configurations will happen in a different location.
  "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp,

  -- Some tooling for jupyterlab
  "rcarriga/nvim-notify",
  "stevearc/dressing.nvim",

  -- Dockerfile
  -- "ekalinin/dockerfile.vim",

  "girishji/pythondoc.vim",

    -- lazydocker.nvim
  {
    "mgierada/lazydocker.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    config = function() require("lazydocker").setup {} end,
    event = "BufRead", -- or any other event you might want to use.
  },

  "averms/black-nvim",

  "mattn/vim-gotmpl",

  -- "google/vim-maktaba",
  -- "google/vim-codefmt",
  -- "google/vim-glaive",

  "github/copilot.vim",

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
  },

  "uros-5/jinja-lsp",

  --  {
  --    "alexander-born/bazel.nvim",
  --    dependencies = {
  --      "nvim-treesitter/nvim-treesitter",
  --      "nvim-lua/plenary.nvim",
  --    },
  --  },
  --
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = { "alexander-born/cmp-bazel" },
  --   opts = function(_, opts)
  --     opts.sources = require("cmp").config.sources(vim.list_extend(opts.sources, { { name = "bazel" } }))
  --   end,
  -- },
}
