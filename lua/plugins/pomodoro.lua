local gh = require('config.utils').gh

-- 1. Notification backend (optional, but gives pretty timer popups)
vim.pack.add { gh 'rcarriga/nvim-notify' }
---@diagnostic disable-next-line: missing-fields
require('notify').setup {
  merge_duplicates = true,
}

-- 2. Pomo timer
vim.pack.add { gh 'epwalsh/pomo.nvim' }
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
