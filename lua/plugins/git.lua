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

vim.keymap.set('n', '<leader>gg', neogit.open, { desc = 'Open Neogit UI' })
vim.keymap.set('n', 'gd', diffview.open, { desc = '[G]it [D]iffview open' })
vim.keymap.set('n', 'gc', diffview.close, { desc = '[G]it Diffview [C]lose' })
vim.keymap.set('n', 'gh', diffview.file_history, { desc = '[G]it file [H]istory' })
