return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {"<leader>Lg", "<cmd>LazyGit<cr>", desc="LazyGit"},
    {"<leader>Lc", "<cmd>LazyGitFilter<cr>", desc="See project commits"},
    {"<leader>Lf", "<cmd>LazyGitFilterCurrentFile<cr>", desc="See file commits"},
  },
}
