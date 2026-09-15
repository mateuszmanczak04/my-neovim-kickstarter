vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/MunifTanjim/nui.nvim',
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
