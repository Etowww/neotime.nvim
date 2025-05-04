-- /lua/neotime/ui.lua created by DBTow

local M = {}


function M.open_window()
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, true, {"00:00:00"})
	local opts = {
		relative = "cursor",
		width = 10,
		height = 2,
		col = 0,
		row = 1,
		anchor = "NW",
		style = "minimal"
	}
	local win = vim.api.nvim_open_win(buf, false, opts)
end

return M

