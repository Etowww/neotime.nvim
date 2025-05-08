--- neotime.nvim/lua/neotime/styles.lua created by DBTow

local config = require("neotime.config")

local M = {}


-- Function to retrieve window style appearance from config and set window options accordingly
function M.get_styles_config()
	local style = config.options.style or "default"

	if style == "minimal" then
		return {
			win_opts = {
				width = 10,
				height = 1,
				title = "",
			}

		}
	elseif style == "default" then
		return {
			win_opts = {
				width = 20,
				height = 2,
				title = "Neotime",
				title_pos = "center",
			}
		}
	else
		return {
			win_opts = {
				width = 20,
				height = 2,
				title = "Neotime",
				title_pos = "center",
			}
		}
	end
end

return M
