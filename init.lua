-- Load lazy.nvim
require("config.lazy")

-- Load language support
require("config.lang")

-- Options (this list is certainly not exhaustive)

-- line numbers
vim.o.number = true

-- ignore case on search
vim.o.ignorecase = true

-- if a capital letter is used in search, then ignorecase is ignored
vim.o.smartcase = true

-- highlight search results
vim.o.hlsearch = true

-- wrap lines
vim.o.wrap = true

-- preserve indent when wrapping lines
vim.o.breakindent = true

-- spaces per tab
vim.o.tabstop = 2

-- spaces per line indent ('<<' and '>>' are affected by this)
vim.o.shiftwidth = 2

-- transform tab to spaces
vim.o.expandtab = false

-- yank to system clipboard and paste from system clipboard
vim.opt.clipboard = "unnamedplus"

-- Kebindings
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
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode overload" })
vim.keymap.set("n", ";", ":", { desc = "Semi-colon also works for commands" })
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "Verical split" })
vim.keymap.set("n", "<leader>tv", "<cmd>vsplit<cr><C-w>l<cmd>term<cr>i", { desc = "Open terminal with vertical split" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, desc = "Exit terminal mode" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "<leader>ch", "<cmd>checkhealth<cr>", { desc = "Check Health shortcut" })
vim.keymap.set("v", "(", "c()<Esc>P", { desc = "Wrap selection in parentheses" })
vim.keymap.set("v", "[", "c[]<Esc>P", { desc = "Wrap selection in square brackets" })
vim.keymap.set("v", "{", "c{}<Esc>P", { desc = "Wrap selection in curly brackets" })
vim.keymap.set("v", '"', 'c""<Esc>P', { desc = "Wrap selection in double quotes" })
vim.keymap.set("v", "'", "c''<Esc>P", { desc = "Wrap selection in single quotes" })

-- lazy
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Reload config" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- neotree
vim.keymap.set("", "<leader>n", "<cmd>Neotree<cr>", { desc = "Open file tree explorer" })

-- bufferline
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>x", "<cmd>Bdelete<cr>", { desc = "Go to previous buffer" })

-- conform
-- -- see lang.lua to see the Format command
vim.keymap.set("n", "<leader>fm", "<cmd>Format<cr>", { desc = "Run formatter" })
