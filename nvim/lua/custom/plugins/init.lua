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
    -- in your plugins/init.lua or similar
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = { "isort", "black" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        },
    },

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
    {
        'diogo464/kubernetes.nvim',
        opts = {
            -- this can help with autocomplete. it sets the `additionalProperties` field on type definitions to false if it is not already present.
            schema_strict = true,
            -- true:  generate the schema every time the plugin starts
            -- false: only generate the schema if the files don't already exists. run `:KubernetesGenerateSchema` manually to generate the schema if needed.
            schema_generate_always = false,
            -- Patch yaml-language-server's validation.js file.
            patch = true,
            -- root path of the yamlls language server. by default it is assumed you are using mason but if not this option allows changing that path.
            yamlls_root = function()
                return "/opt/homebrew/bin/yaml-language-server"
            end
        }
    },

    {
        'kiddos/gemini.nvim',
        opts = {
            blacklist_filetypes = { 'help', 'qf', 'toml', 'xml' },
        }
    }
}
