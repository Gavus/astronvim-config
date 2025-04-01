-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "lua",
      "markdown",
      "python",
      "vim",
      "xml",
    },
  },
}
