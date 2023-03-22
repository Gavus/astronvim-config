return {
  'vimwiki/vimwiki',
  lazy = false,
  init = function()
    vim.g.vimwiki_global_ext = 0 -- Turn off creation of temporary wikis.
    vim.g.vimwiki_map_prefix = '<leader>v' -- Change vimwiki leader key to space v.
    vim.g.vimwiki_links_space_char = '-' -- Make vimwiki create names with - instead of space.
    vim.g.vimwiki_list = { -- Make vimwiki use markdown instead.
      {
        path = '~/vimwiki',
        syntax = 'markdown',
        ext = '.md',
      },
    }
  end,
}
