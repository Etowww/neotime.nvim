-- /lua/neotime/init.lua created by DBTow

local config = require("neotime.config")
local ui = require("neotime.ui")
local timer = require("neotime.timer")

local M = {}

function M.setup()

	vim.api.nvim_create_user_command("NeotimeToggle", ui.toggle_window, {})
	vim.api.nvim_create_user_command("StopwatchStart", timer.start, {})
	vim.api.nvim_create_user_command("StopwatchStop", timer.stop, {})
	vim.api.nvim_create_user_command("StopwatchReset", timer.reset, {})
end

return M
