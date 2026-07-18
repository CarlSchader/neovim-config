local M = {}

---@param vertical? boolean
function M.spawn_term(vertical)
	vertical = vertical or false
	local buf = vim.api.nvim_create_buf(false, true)
	local split_command = vertical and "vertical" or "horizontal"
	vim.cmd(split_command + " <cr><C-w>l<cmd>term<cr>i")
end

return M
