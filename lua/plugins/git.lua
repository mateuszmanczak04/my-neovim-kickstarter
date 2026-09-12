local gh = require('config.utils').gh

vim.pack.add {
  gh 'nvim-lua/plenary.nvim',
  gh 'sindrets/diffview.nvim',
  gh 'NeogitOrg/neogit',
}

local neogit = require 'neogit'
local diffview = require 'diffview'

diffview.setup {}

neogit.setup {
  integrations = {
    diffview = true,
  },
}

vim.keymap.set('n', 'gg', neogit.open, { desc = '[G]it status (Neogit)' })
vim.keymap.set('n', 'gd', 'DiffviewOpen', { desc = '[G]it [D]iffview open' })
vim.keymap.set('n', 'gc', 'DiffviewClose', { desc = '[G]it Diffview [C]lose' })
vim.keymap.set('n', 'gh', 'DiffviewFileHistory %', { desc = '[G]it file [H]istory' })
