---@type LazySpec
return {
  "happyeric77/joplin.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("joplin").setup {
      -- Your configuration options here
    }
  end,
}
