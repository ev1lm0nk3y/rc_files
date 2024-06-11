return {
    "kiyoon/jupynium.nvim",
    build = "pip install .",
    -- build = "conda run --no-capture-output -n jupynium pip install .",
    enabled = vim.fn.isdirectory(vim.fn.expand "/opt/anaconda3/envs/jupynium"),
    event = { "BufReadPost" },
    lazy = true,
    config = function()
      require("jupynium").setup({
        python_host = 'python3',
        default_notebook_URL = 'http://localhost:18988/',
        jupyter_command = {'jupyter', 'notebook'},
        auto_start_server = {
          enable = true,
        },
        auto_start_sync = {
          enable = false,
        },
      })
    end
  }
