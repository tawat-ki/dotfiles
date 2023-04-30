local spawn = require("awful.spawn")
local capi = { keygrabber = keygrabber }
local beautiful = require("beautiful")
local gfs = require("gears.filesystem")
local icon = require("deboost.icon")
local naughty = require("naughty")
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local prompt = awful.widget.prompt()
awful.placement.top(w, { margins = { top = 40 } })
local ICON = os.getenv("HOME") .. "/.config/awesome/awesome-wm-widgets/translate-widget/gnome-translate.svg"
--- Main function - takes the user input and shows the widget with translation
-- @param request_string - user input (dog enfr)
local function extract(input_string)
	local word, lang = input_string:match("^(.+)%s(%a%a%a%a)$")

	if word ~= nil and lang ~= nil then
		lang = lang:sub(1, 2) .. "-" .. lang:sub(3)
	end
	return word, lang
end
local function show_warning(message)
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Translate Shell",
		text = message,
    timeout=5,
	})
end
local input_widget = wibox({
	visible = false,
	width = 300,
	height = 50,
	maxmimum_width = 300,
	maxmimum_height = 900,
	ontop = true,
	screen = mouse.screen,
	expand = true,
	bg = beautiful.bg_normal,
	max_widget_size = 500,
	border_color = "#ff6e67",
	border_width = 2,
	shape = gears.shape.rect,
})
input_widget:setup({
	{
		prompt,
		bg = beautiful.bg_normal,
		widget = wibox.container.background,
	},
	margins = 8,
	widget = wibox.container.margin,
})
local w = awful.popup({
	widget = {},
	visible = false,
	maximum_width = 400,
	width = 400,
	border_color = "#ff6e67",
	border_width = 2,
  opacity=0.9,
	ontop = true,
	bg = beautiful.bg_normal,
	shape = gears.shape.rect,
})
local function launch()
	local args = user_args or {}

	local api_key = args.api_key
	local url = args.url
  if w.visible == true then
    w.visible = false
    return
  end
	awful.placement.top(input_widget, { margins = { top = 40 }, parent = awful.screen.focused() })
	input_widget.visible = true
	awful.prompt.run({
		prompt = "<b>Translate</b>: ",
		textbox = prompt.widget,
    font="Hack 12",
		history_path = gfs.get_dir("cache") .. "/translate_history",
		bg_cursor = "#66ccff",
		exe_callback = function(text)
			if not text or #text == 0 then
				return
			end
			local cmd = "trans en:th -no-init  -no-ansi " .. text 
			--local cmd = "dict -d wn " .. text 
			spawn.easy_async(cmd, function(stdout, stderr)
				if stderr ~= "" then
					show_warning(stderr)
				end
        stdout=stdout:sub(1,-2)
				w:setup({
					{
						{
							{
								{
									image = ICON,
									widget = wibox.widget.imagebox,
									resize = false,
								},
								valign = "center",
								layout = wibox.container.place,
							},
							{
								{
									id = "res",
									markup = "<b>" .. '</b>: <span color="#FFFFFF"> ' .. stdout .. "</span>",
                  font = "Hack 12",
									widget = wibox.widget.textbox,
								},
								id = "text",
								layout = wibox.layout.fixed.vertical,
							},
							id = "left",
							spacing = 2,
							layout = wibox.layout.fixed.horizontal,
						},
						bg = beautiful.bg_normal,
						--forced_width = 400,
						widget = wibox.container.background,
					},
					color = beautiful.bg_normal,
					margins = 2,
					widget = wibox.container.margin,
				})
        awful.placement.top_right(w, { margins = { top = 40 }, parent = awful.screen.focused() })
        --awful.placement.top(input_widget, { margins = { top = 40 }, parent = awful.screen.focused() })
				w.visible = true
				w:buttons(awful.util.table.join(
					awful.button({}, 1, function()
						--spawn.with_shell(
						--	"echo '" .. resp.translations[1].translation .. "' | xclip -selection clipboard"
						--)
						w.visible = false
					end),
					awful.button({}, 3, function()
						--spawn.with_shell("echo '" .. to_translate .. "' | xclip -selection clipboard")
						w.visible = false
					end)
				))

			--	capi.keygrabber.run(function(_, key, event)
			--		if event == "release" then
			--			return
			--		end
			--		if key then
			--			capi.keygrabber.stop()
			--			w.visible = false
			--		end
			--	end)
			end)
		end,
		done_callback = function()
			input_widget.visible = false
		end,
	})
end
return {
	launch = launch,
}
