-- ./lua/neotime/timer.lua created by DBTow
local Timer = {
	start_time = 0,
	elapsed_time = 0,
	stopwatch_running = false
}

function Timer.format_time(milliseconds)
	local total_seconds = milliseconds / 1000
	local hours = math.floor(total_seconds / 3600)
	local remaining = (total_seconds % 3600)
	local minutes = math.floor(remaining / 60)
	local seconds = remaining % 60

	return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

function Timer.start()
	if Timer.stopwatch_running then
		print("The stopwatch is already running")
		return end
	Timer.start_time = vim.uv.now() - Timer.elapsed_time
	Timer.stopwatch_running = true
end

function Timer.stop()
	if not Timer.stopwatch_running then
		print("No active stopwatch")
		return end
	Timer.elapsed_time = vim.uv.now() - Timer.start_time
	Timer.stopwatch_running = false
end

function Timer.reset()
	if Timer.stopwatch_running then
		Timer.stop()
	end
	Timer.elapsed_time = 0
	print("Time reset to 00:00:00")
end

function Timer.get_time()
	if Timer.stopwatch_running then
		return Timer.format_time(vim.uv.now() - Timer.start_time)
	end
	return Timer.format_time(Timer.elapsed_time)
end

return Timer 
