-- /lua/neotime/ui.lua created by DBTow

local M = {
	buf = nil,
	win = nil,
	update_timer = nil,
	ui_visible = false
}


function M.show_window()
	-- Create buffer if it does not exist
	M.buf = M.buf or vim.api.nvim_create_buf(false, true)

	-- Set initial text content
	vim.api.nvim_buf_set_lines(M.buf, 0, -1, true, {require('neotime.timer').get_time()})

	-- Only create a window if not already visible
	if not (M.win and vim.api.nvim_win_is_valid(M.win)) then

		-- Window configuration options
		local opts = {
			relative = "editor",
			width = 20,
			height = 2,
			col = vim.o.columns,
			row = 0,
			anchor = "NE",
			style = "minimal",
			focusable = false,
			border = "rounded",
			title = "Neotime",
			title_pos = "center",
		}
		M.win = vim.api.nvim_open_win(M.buf, false, opts)
		M.ui_visible = true
	end

	-- Start/restart update timer
	M.start_updates()
end

function M.hide_window()
	-- Stop updates
	M.stop_updates()

	-- close window if valid
	if M.win and vim.api.nvim_win_is_valid(M.win) then
		vim.api.nvim_win_close(M.win, true)
		M.win = nil
	end
	M.ui_visible = false
end

function M.start_updates()
	-- To ensure we don't create multiple timers
	M.stop_updates()

	M.update_timer = vim.uv.new_timer()
	local function update_stopwatch()
		if M.buf and vim.api.nvim_buf_is_valid(M.buf) then
			local stopwatch_time = require('neotime.timer').get_time()
		
		-- Schedule the update in the main thread
			vim.schedule(function()
				vim.api.nvim_buf_set_lines(M.buf, 0, -1, true, { stopwatch_time })
				vim.cmd("redraw")
			end)
		end
	end

	-- Start a repeating timer: 0ms delay, repeat every 50ms
	M.update_timer:start(0, 50, vim.schedule_wrap(update_stopwatch))
end

function M.stop_updates()
	if M.update_timer then
		M.update_timer:stop()
		M.update_timer:close()
		M.update_timer = nil
	end
end

function M.toggle_window()
	if M.ui_visible then
		M.hide_window()
	else
		M.show_window()
	end
end

return M

