local gh = require('config.utils').gh

vim.pack.add {
  { src = gh 'nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  gh 'nvim-lua/plenary.nvim',
  gh 'MunifTanjim/nui.nvim',
}
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })
require('neo-tree').setup {
  filesystem = {
    window = {
      mappings = {
        ['<leader>e'] = 'close_window',
      },
    },
  },
}
