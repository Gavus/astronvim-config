return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "bashls",
        "clangd",
        "grammarly",
        "lua_ls",
        "marksman",
        "pyright",
        "sourcery",
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
        "pydocstyle",
        "pyflakes",
        "pylint",
        "shellcheck",
      },
    },
  },
}
