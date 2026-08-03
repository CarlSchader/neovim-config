local M = {}

---@param opts? { vertical?: boolean }
function M.spawn_term(opts)
	opts = opts or {}
	local vertical = opts.vertical or false
	local buf = vim.api.nvim_create_buf(false, true)
	local split_command = vertical and "vsplit" or "split"
	vim.cmd(split_command)
	vim.api.nvim_win_set_buf(1, buf)
	vim.fn.termopen(os.getenv("SHELL") or "/bin/sh")
	vim.cmd("startinsert")
end

return M
