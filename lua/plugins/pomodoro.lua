vim.pack.add { 'https://github.com/epwalsh/pomo.nvim' }
---@diagnostic disable-next-line: missing-fields
require('pomo').setup {
  notifiers = {
    -- In-editor
    {
      name = 'Default',
      opts = {
        sticky = false,
      },
    },
    -- MacOS
    {
      name = 'System',
    },
  },
}
