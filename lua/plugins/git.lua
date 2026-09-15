vim.pack.add {
  'https://github.com/sindrets/diffview.nvim',
  'https://github.com/NeogitOrg/neogit',
  'https://github.com/lewis6991/gitsigns.nvim',
}

local neogit = require 'neogit'
local diffview = require 'diffview'
local gitsigns = require 'gitsigns'

diffview.setup {
  hooks = {
    -- Show diffed files in full, unfolded, instead of collapsing unchanged regions.
    diff_buf_win_enter = function(_, winid) vim.wo[winid].foldlevel = 99 end,
  },
}

neogit.setup {
  integrations = {
    diffview = true,
  },
}

vim.keymap.set('n', '<leader>gg', neogit.open, { desc = 'Open Neogit UI' })
vim.keymap.set('n', 'gd', diffview.open, { desc = '[G]it [D]iffview open' })
vim.keymap.set('n', 'gc', diffview.close, { desc = '[G]it Diffview [C]lose' })
vim.keymap.set('n', 'gh', diffview.file_history, { desc = '[G]it file [H]istory' })

gitsigns.setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '┆' },
  },
  signs_staged = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '┆' },
  },
  signs_staged_enable = true,
  signcolumn = true,
  current_line_blame = true,
  on_attach = function(bufnr)
    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        gitsigns.nav_hunk 'next'
      end
    end, { desc = 'Jump to next git [c]hange', buf = bufnr })

    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        gitsigns.nav_hunk 'prev'
      end
    end, { desc = 'Jump to previous git [c]hange', buf = bufnr })
  end,
}
