local gh = require('config.utils').gh

vim.pack.add { gh 'stevearc/conform.nvim' }
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
  -- You can also specify external formatters in here.
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'ruff_format', 'ruff_organize_imports' },
    rust = { 'rustfmt', lsp_format = 'fallback' },
    javascript = { 'biome', 'prettier', stop_after_first = true },
    typescript = { 'biome', 'prettier', stop_after_first = true },
    javascriptreact = { 'biome', 'prettier', stop_after_first = true },
    typescriptreact = { 'biome', 'prettier', stop_after_first = true },
    json = { 'biome', 'prettier', stop_after_first = true },
    yaml = { 'biome', 'prettier', stop_after_first = true },
    html = { 'biome', 'prettier', stop_after_first = true },
    css = { 'biome', 'prettier', stop_after_first = true },
    scss = { 'biome', 'prettier', stop_after_first = true },
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })
