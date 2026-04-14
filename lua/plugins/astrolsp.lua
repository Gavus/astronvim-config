-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      autoformat = false, -- disable auto formatting on start
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = true, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          "go",
          "lua",
        },
      },
    },
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      clangd = {
        capabilities = { offsetEncoding = "utf-8" },
        cmd = { "clangd", "--background-index" },
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<Leader>lH", "<cmd>ClangdSwitchSourceHeader<cr>", {
            buffer = bufnr,
            desc = "Switch Source/Header",
          })
        end,
      },
      basedpyright = {
        settings = {
          basedpyright = {
            typeCheckingMode = "standard",
          },
        },
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
              extraArgs = { "--profile", "rust-analyzer" },
            },
          },
        },
      },
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {},
    },
  },
}
