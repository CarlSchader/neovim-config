-- Kebindings
--
-- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
-- modes:
-- n: normal
-- i: inset
-- x: visual
-- s: selection
-- v: visual + selection
-- t: terminal
-- o: operator-pending
-- '': normal and visual and selection and operator-pending (I think)
-- {lhs}: the key to bind
-- {rhs}: action to execute
-- {opts}: lua table of options i.e. {desc = 'Save'}
-- opts keys:
-- desc: String that describes what the binding does.
-- remap: boolean that determines if the binding is recursive (default false).
-- Recursive bindings basically remap previous keybindings to new ones.
-- buffer: Boolean or number

vim.keymap.set("n", "<leader>rl", "<cmd>source %<cr>", { desc = "Reload config" })

vim.keymap.set("n", "<leader>e", function()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted and vim.api.nvim_buf_get_name(buf) ~= "" then
			vim.api.nvim_buf_call(buf, function()
				vim.cmd("e")
			end)
		end
	end
	vim.cmd("checktime")
	require("neo-tree.sources.manager").refresh("filesystem")
end, { desc = "Reload all buffers" })

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode overload" })

vim.keymap.set("n", ";", ":", { desc = "Semi-colon also works for commands" })

vim.keymap.set("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "Verical split" })

vim.keymap.set("n", "<leader>tv", "<cmd>vsplit<cr><C-w>l<cmd>term<cr>i", { desc = "Open terminal with vertical split" })

vim.keymap.set("t", "<C-x>", [[<C-\><C-n>]], { noremap = true, desc = "Exit terminal mode" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "rn", vim.lsp.buf.rename(), { desc = "Rename references" })

vim.keymap.set("n", "<leader>ch", "<cmd>checkhealth<cr>", { desc = "Check Health shortcut" })

vim.keymap.set("v", "(", "c()<Esc>P", { desc = "Wrap selection in parentheses" })
vim.keymap.set("v", "[", "c[]<Esc>P", { desc = "Wrap selection in square brackets" })
vim.keymap.set("v", "{", "c{}<Esc>P", { desc = "Wrap selection in curly brackets" })
vim.keymap.set("v", '"', 'c""<Esc>P', { desc = "Wrap selection in double quotes" })
vim.keymap.set("v", "'", "c''<Esc>P", { desc = "Wrap selection in single quotes" })

vim.keymap.set("i", "(", "()<ESC>i", { desc = "Auto type two parens" })
vim.keymap.set("i", "[", "[]<ESC>i", { desc = "Auto type two square brackets" })
vim.keymap.set("i", "{", "{}<ESC>i", { desc = "Auto type two curly brackets" })
vim.keymap.set("i", '"', '""<ESC>i', { desc = "Auto type two double quotes" })
-- vim.keymap.set("i", "'", "''<ESC>i", { desc = "Auto type two single quotes" })

vim.keymap.set({ "n", "t" }, "<A-h>", "<C-w>h", { desc = "<alt/option> instead of CTRL+w for nav left one pane" })
vim.keymap.set({ "n", "t" }, "<A-j>", "<C-w>j", { desc = "<alt/option> instead of CTRL+w for nav down one pane" })
vim.keymap.set({ "n", "t" }, "<A-k>", "<C-w>k", { desc = "<alt/option> instead of CTRL+w for nav up one pane" })
vim.keymap.set({ "n", "t" }, "<A-l>", "<C-w>l", { desc = "<alt/option> instead of CTRL+w for nav right one pane" })

-- lazy
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Reload config" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- neotree
vim.keymap.set("", "<leader>n", function()
	if vim.bo.filetype == "neo-tree" then
		vim.cmd("wincmd p")
	else
		vim.cmd("Neotree focus")
	end
end, { desc = "Open file tree explorer" })

-- bufferline
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>x", "<cmd>Bdelete<cr>", { desc = "Delete current bufffer" })

-- tabnext and tabprev
vim.keymap.set("n", "<leader><Tab>", "<cmd>tabnext<cr>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader><S-Tab>", "<cmd>tabnext<cr>", { desc = "Go to next tab" })

-- conform
-- -- see lang.lua to see the Format command
vim.keymap.set("n", "<leader>fm", "<cmd>Format<cr>", { desc = "Run formatter" })
