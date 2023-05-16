return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.utility.neodim" },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = "80",
      custom_colorcolumn = {
        python = "100",
      },
    },
  },
}
