-- Ensuring that this plugin is loaded successfully into the runtimepath with a print statement
-- In the config file for nvim_test: vim.opt.rpt:append("~/neovimPlugins/neotime.nvim/)
--print("neotime.nvim loaded")

require("neotime").setup()

require("neotime").start()
require("neotime").stop()
require("neotime").reset()

