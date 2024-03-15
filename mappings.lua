return {
  n = { -- Normal mode.
    ["<leader>lH"] = { "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header" },
    ["<leader>v"] = { "VimWiki", desc = "VimWiki" },
  },
  v = { -- Visual mode.
    ["<leader>s"] = { ":Sort<cr>", desc = "Sort" },
  },
}
