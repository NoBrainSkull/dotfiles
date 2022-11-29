local M = {}

local function map(op, outer_opts)
  opts = outer_opts or {noremap = true}
  return function(lhs, rhs, override_opts)
    opts = vim.tbl_extend("force", opts, override_opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

M.nmap = map("n", {noremap = false})
M.nnoremap = map("n")
M.vnoremap = map("v")
M.xnoremap = map("x")
M.inoremap = map("i")

return M
