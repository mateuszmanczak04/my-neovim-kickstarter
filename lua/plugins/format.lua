vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

-- Only run a formatter when its config file is present somewhere above the
-- buffer (project has opted in). No config found -> don't format by default.
---@param patterns string[]
local function has_config(patterns)
  return function(_, ctx) return vim.fs.find(patterns, { path = ctx.dirname, upward = true })[1] ~= nil end
end

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
  formatters = {
    stylua = { condition = has_config { 'stylua.toml', '.stylua.toml' } },
    ruff_format = { condition = has_config { 'pyproject.toml', 'ruff.toml', '.ruff.toml' } },
    ruff_organize_imports = { condition = has_config { 'pyproject.toml', 'ruff.toml', '.ruff.toml' } },
    rustfmt = { condition = has_config { 'rustfmt.toml', '.rustfmt.toml' } },
    biome = { condition = has_config { 'biome.json', 'biome.jsonc' } },
    prettier = {
      condition = has_config {
        '.prettierrc',
        '.prettierrc.json',
        '.prettierrc.yml',
        '.prettierrc.yaml',
        '.prettierrc.js',
        '.prettierrc.cjs',
        '.prettierrc.mjs',
        'prettier.config.js',
        'prettier.config.cjs',
        'prettier.config.mjs',
      },
    },
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })
