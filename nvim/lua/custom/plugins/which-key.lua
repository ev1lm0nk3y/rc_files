return {
  "folke/which-key.nvim",
  enabled = true,
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    require("which-key").setup {}
  end
}
