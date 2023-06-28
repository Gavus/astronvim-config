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
        "pylsp",
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
        "shellcheck",
        "beautysh",
        "luaformatter",
      },
    },
  },
}
