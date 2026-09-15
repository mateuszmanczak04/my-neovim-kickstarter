vim.pack.add { 'https://github.com/NMAC427/guess-indent.nvim' }
require('guess-indent').setup {}

vim.pack.add { 'https://github.com/rcarriga/nvim-notify' }
---@diagnostic disable-next-line: missing-fields
require('notify').setup {
  merge_duplicates = true,
}

vim.pack.add { 'https://github.com/folke/which-key.nvim' }
require('which-key').setup {

  delay = 0,
  icons = { mappings = vim.g.have_nerd_font },

  spec = {
    { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>g', group = '[G]it' },
    { 'gr', group = 'LSP Actions', mode = { 'n' } },
  },
}

vim.pack.add { 'https://github.com/folke/tokyonight.nvim' }
---@diagnostic disable-next-line: missing-fields
require('tokyonight').setup {
  styles = {
    comments = { italic = false }, -- Disable italics in comments
  },
}

vim.cmd.colorscheme 'tokyonight-night'

vim.pack.add { 'https://github.com/folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }

vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

if vim.g.have_nerd_font then
  require('mini.icons').setup()
  MiniIcons.mock_nvim_web_devicons()
end

require('mini.ai').setup {
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
  n_lines = 500,
}

require('mini.surround').setup()

local statusline = require 'mini.statusline'
statusline.setup { use_icons = vim.g.have_nerd_font }

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function() return '%2l:%-2v' end

-- ... and there is more!
--  Check out: https://github.com/nvim-mini/mini.nvim
