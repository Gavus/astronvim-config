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
      autoformat = false, -- enable or disable auto formatting on start
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
          "sh",
        },
      },
    },
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      clangd = {
        capabilities = { offsetEncoding = "utf-8" },
        cmd = { "clangd", "--background-index" },
      },
      sourcery = {
        init_options = { token = "" },
      },
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = { enabled = true },
              pyflakes = { enabled = true },
              pylint = { enabled = true },
            },
          },
        },
      },
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        -- TODO: Add this only for clangd.
        ["<Leader>lH"] = { "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header" },
      },
    },
  },
}
