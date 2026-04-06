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

-- auto read changed files when switching back and forth from neovim
vim.o.autoread = true
