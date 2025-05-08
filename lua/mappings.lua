require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<ESC>", { desc = "quick <ESC> in normal mode" })

map("n", "gr", function() vim.lsp.buf.references() end, { desc = "LSP go to references" })

-- map("n", "<A-t>", function()  end, { desc = "Toggle theme" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
