local M = {}

-- Only run a formatter when its config file is present somewhere above the
-- buffer (project has opted in). No config found -> don't format by default.
---@param patterns string[]
function M.has_config(patterns)
  return function(_, ctx) return vim.fs.find(patterns, { path = ctx.dirname, upward = true })[1] ~= nil end
end

return M
