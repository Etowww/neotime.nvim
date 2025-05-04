-- ./lua/neotime/timer.lua created by DBTow
local Timer = {}
local stopwatch_timer = nil
local start_time = 0
local elapsed_time = 0
local stopwatch_running = false

function Timer.format_time(milliseconds)
	local total_seconds = milliseconds / 1000
	local hours = math.floor(total_seconds / 3600)
	local remaining = (total_seconds % 3600)
	local minutes = math.floor(remaining / 60)
	local seconds = remaining % 60

	return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

function Timer.start()
	start_time = vim.uv.now()
	print("Stopwatch Started")
end

function Timer.stop()
	current_time = vim.uv.now()
	elapsed_time = current_time - start_time
	print(Timer.format_time(elapsed_time))
end

function Timer.reset()
	current_time = 0
	start_time = 0
	elapsed_time = 0
	print("Time reset to: 00:00:00")
end


return Timer 
