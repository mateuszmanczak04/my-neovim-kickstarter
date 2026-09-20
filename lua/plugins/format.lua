vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

-- No formatters are configured globally. Each project declares its own
-- formatters_by_ft/formatters via a project-local .nvim.lua (see
-- `exrc`/`secure` in config/options.lua), typically reusing
-- require('util.conform').has_config to gate on that project's own config file.
require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    local ignore_filetypes = { 'markdown' }
    if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then return nil end

    return { timeout_ms = 1000, lsp_format = 'fallback' }
  end,
  default_format_opts = {
    lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })
