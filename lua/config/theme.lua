local DARK_COLOR_SCHEME = "moonfly"
local LIGHT_COLOR_SCHEME = "one-light"

local THEME_PATH = os.getenv("HOME") .. "/.local/state/theme"
local last_theme = nil

local function read_theme()
	local content = "dark"
	local theme_file, err = io.open(THEME_PATH, "r")
	if theme_file then
		content = theme_file:read("*a")
		theme_file:close()
	else
		print(err)
	end

	if content ~= "dark" and content ~= "light" then
		content = "dark"
	end

	return content
end

-- local function write_theme(theme_text)
-- 	local theme_file, err = io.open(THEME_PATH, "w")
-- 	if theme_file then
-- 		theme_file:write(theme_text)
-- 		theme_file:close()
-- 	else
-- 		print(err)
-- 	end
-- end

local function refresh_theme()
	local content = read_theme()

	if last_theme == content then
		return
	else
		last_theme = content
	end

	local target = nil
	if content == "dark" then
		target = DARK_COLOR_SCHEME
	else
		target = LIGHT_COLOR_SCHEME
	end

	vim.o.background = content
	vim.cmd.colorscheme(target)
	vim.defer_fn(function()
		-- Re-fire ColorScheme so plugins re-read
		vim.o.background = content
		vim.cmd.colorscheme(target)
	end, 200)
end

local uv = vim.uv or vim.loop
local watcher = nil

local function start_watcher()
	if watcher then
		pcall(function()
			watcher:stop()
		end)
		pcall(function()
			watcher:close()
		end)
		watcher = nil
	end

	watcher = uv.new_fs_event()
	if not watcher then
		vim.notify("Error starting fs watcher for theme", vim.log.levels.WARN)
		return
	end

	local ok, err = pcall(function()
		watcher:start(
			THEME_PATH,
			{},
			vim.schedule_wrap(function(fs_err)
				if fs_err then
					vim.notify("Theme watcher error: " .. fs_err, vim.log.levels.WARN)
					return
				end
				refresh_theme()
				start_watcher()
			end)
		)
	end)

	if not ok then
		vim.notify("Theme watcher failed to start: " .. tostring(err), vim.log.levels.WARN)
	end
end

refresh_theme()
start_watcher()
