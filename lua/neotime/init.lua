-- /lua/neotime/init.lua created by DBTow

local ui = require("neotime.ui")

local M = {}

function M.setup()
	vim.api.nvim_create_user_command("NeotimeTest", function()
		ui.open_window()
	end, {})
end

return M
