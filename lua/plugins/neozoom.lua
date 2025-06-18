---@type LazySpec
return {
  "nyngwang/neozoom.lua",
  opts = {},
  require("which-key").add {
    { "<C-w>z", "<cmd>NeoZoomToggle<CR>", prefix = "<C-w>", desc = "Zoom", mode = "n" },
  },
}
