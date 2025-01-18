return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup {
      ensure_installed = {
        "bash",
        "dockerfile",
        "go",
        "graphql",
        "helm",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "nginx",
        "python",
        "regex",
        "ssh_config",
        "terraform",
        "tmux",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end
}
