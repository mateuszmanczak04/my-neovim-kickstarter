local gh = require('config.utils').gh

vim.pack.add { gh 'windwp/nvim-autopairs' }
require('nvim-autopairs').setup {}
