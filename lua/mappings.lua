require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<ESC>", { desc = "quick <ESC> in insert mode" })

map("n", "gr", function() vim.lsp.buf.references() end, { desc = "LSP go to references" })
