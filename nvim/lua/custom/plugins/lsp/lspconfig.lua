return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

    vim.lsp.set_log_level("error")

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure typescript server with plugin
    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure graphql language server
    lspconfig["graphql"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    -- configure Dockerfile language server
    lspconfig["dockerls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "dockerfile" },
      settings = {
        root_dir = {'Dockerfile', 'Dockerfile.*'},
      },
    })
    vim.api.nvim_create_autocmd({"BufWritePre"}, {
      pattern = {"Dockerfile*"},
      callback = function()
        vim.lsp.buf.format()
      end,
    })

    -- configure python server
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      filetypes = { "python" },
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true
          }
        }
      },
    })
--    vim.api.nvim_create_autocmd({"BufWritePre"}, {
--      pattern = { "*.py" },
--      callback = vim.cmd.Black()
--    })

--    lspconfig["pylsp"].setup({
--      capabilities = capabilities,
--      on_attach = on_attach,
--      settings = {
--        pylsp = {
--          plugins = {
--            pycodestyle = {
--              ignore = {'W391'},
--              maxLineLength = 100
--            }
--          }
--        }
--      }
--    })
--

    lspconfig["jedi_language_server"].setup({
      capabilities = capabilities,
      filetypes = { "python" },
      on_attach = on_attach,
      cmd = { 'jedi-language-server' },
    })

    -- configure Helm server
    lspconfig["helm_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure terraform server
    lspconfig["terraformls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      on_init = function(client)
        client.notify("workspace/didChangeConfiguration", { settings = { ["terraform"] = { format = { command = "terraform fmt -", args = { "%file%" } } } } })
      end,
      filetypes = { "terraform" },
      settings = {
        terraformls = {
          initializationOptions = {
            experimentalFeatures = {
              validateOnSave = true,
              prefillRequiredFields = true,
            }
          }
        }
      }
    })
    vim.api.nvim_create_autocmd({"BufWritePre", "BufNewFile"}, {
      pattern = {"*.tf", "*.tfvars"},
      callback = function()
        vim.filetype = "terraform"
        vim.lsp.buf.format()
      end,
    })

    -- configure yaml server
    lspconfig["yamlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "yaml" },
      settings = {
        yaml = {
          format = {
            enable = true,
            proseWrap = "always",
          },
          completion = true,
        },
      },
    })

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    -- configure gopls server
    lspconfig["gopls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    })
    vim.api.nvim_create_autocmd({"BufWritePre"}, {
      pattern = "*.go",
      callback = function()
       local params = vim.lsp.util.make_range_params()
       params.context = {only = {"source.organizeImports"}}
       -- buf_request_sync defaults to a 1000ms timeout. Depending on your
        -- machine and codebase, you may want longer. Add an additional
       -- argument after params if you find that you have to write the file
        -- twice for changes to be saved.
       -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
       local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 5000)
       for cid, res in pairs(result or {}) do
         for _, r in pairs(res.result or {}) do
           if r.edit then
             local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
              vim.lsp.util.apply_workspace_edit(r.edit, enc)
           end
         end
       end
       vim.lsp.buf.format({async = false})
      end
    })

    -- configure jinja server
    vim.filetype.add {
      extension = {
        jinja = 'jinja',
        jinja2 = 'jinja',
        j2 = 'jinja',
      },
    }
    lspconfig['jinja-lsp'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { 'jinja', 'rust' },
      cmd = { 'jinja-lsp' },
      settings = {
        root_dir = function(fname)
          return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
        end,
      },
    })
  end,
}
