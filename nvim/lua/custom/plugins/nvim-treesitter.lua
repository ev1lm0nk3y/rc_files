return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup {
      ensure_installed = { "lua", "python", "terraform", "typescript", "vim", "vimdoc", "yaml"},
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end
}
