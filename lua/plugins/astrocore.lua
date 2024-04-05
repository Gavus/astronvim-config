-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        linebreak = true, -- break at space.
        list = true, -- show certain characters.
        listchars = "tab:▷▷", -- show tabs.
        spell = true, -- sets vim.opt.spell
      },
    },
    -- Mappings can be configured through AstroCore as well.
    mappings = {
      n = { -- Normal mode.
        ["<Leader>v"] = { desc = "VimWiki" },
      },
      v = { -- Visual mode.
        ["<Leader>s"] = { ":Sort<cr>", desc = "Sort" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
