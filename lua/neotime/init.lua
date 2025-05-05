-- /lua/neotime/init.lua created by DBTow

local ui = require("neotime.ui")

local timer = require("neotime.timer")

local M = {}

function M.setup()
	vim.api.nvim_create_user_command("NeotimeToggle", function()
		ui.toggle_window()
	end, {})
end

function M.start()
	vim.api.nvim_create_user_command("StopwatchStart", function()
		timer.start()
	end, {})
end

function M.stop()
	vim.api.nvim_create_user_command("StopwatchStop", function()
		timer.stop()
	end, {})
end

function M.reset()
	vim.api.nvim_create_user_command("StopwatchReset", function()
		timer.reset()
	end, {})
end

return M
