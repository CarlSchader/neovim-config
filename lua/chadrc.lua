-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "rosepine-dawn",
  theme_toggle = { "ashes", "rosepine-dawn" },

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.term = {
  sizes = { sp = 0.3, vsp = 0.4 },
}

return M
