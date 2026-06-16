local M = {}

local DARK_COLOR_SCHEME = "moonfly"
local LIGHT_COLOR_SCHEME = "one-light"

local function apply()
	local scheme = (vim.o.background == "dark") and DARK_COLOR_SCHEME or LIGHT_COLOR_SCHEME
	pcall(vim.cmd.colorscheme, scheme)
end

local function set_bg(bg)
	if vim.o.background ~= bg then
		vim.o.background = bg
	else
		apply()
	end
end

---@param opts? { dark?: string, light?: string }
function M.setup(opts)
	opts = opts or {}
	DARK_COLOR_SCHEME = opts.dark or DARK_COLOR_SCHEME
	LIGHT_COLOR_SCHEME = opts.light or LIGHT_COLOR_SCHEME
	local group = vim.api.nvim_create_augroup("ThemeSync", { clear = true })

	vim.api.nvim_create_autocmd("OptionSet", {
		group = group,
		pattern = "background",
		callback = apply,
	})

	local modes = { "n", "i", "v", "t", "c" }
	vim.keymap.set(modes, "\27[2031;1~", function()
		set_bg("light")
	end, { desc = "Theme: light (WezTerm)" })
	vim.keymap.set(modes, "\27[2031;2~", function()
		set_bg("dark")
	end, { desc = "Theme: dark (WezTerm)" })

	apply()
end

return M
