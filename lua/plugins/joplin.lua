---@type LazySpec
return {
  "happyeric77/joplin.nvim",
  cmd = { "joplin" },
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("joplin").setup {
      startup = {
        show_warnings = false, -- Disable warning messages
      },
    }
  end,
}
