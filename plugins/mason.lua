return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "bashls",
        "clangd",
        "grammarly",
        "lua_ls",
        "pyright",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "codespell",
        "gitlint",
        "markdownlint",
        "misspell",
        "pylint",
        "shellcheck",
      },
    },
  },
}
