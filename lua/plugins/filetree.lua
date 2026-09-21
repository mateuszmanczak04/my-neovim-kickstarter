vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/MunifTanjim/nui.nvim',
}
vim.keymap.set('n', '<leader>e', function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == 'neo-tree' then
      vim.cmd.Neotree 'close'
      return
    end
  end
  vim.cmd.Neotree 'reveal'
end, { desc = 'NeoTree toggle', silent = true })
require('neo-tree').setup {
  filesystem = {
    window = {
      mappings = {
        ['<leader>e'] = 'close_window',
      },
    },
    filtered_items = {
      hide_dotfiles = false, -- show all dotfiles...
      hide_gitignored = true, -- ...except what .gitignore excludes
      hide_by_name = { '.git' }, -- .git itself isn't normally gitignored, so hide it explicitly
    },
  },
}
