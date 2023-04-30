local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local modkey = "Mod4"
local config_path = gears.filesystem.get_configuration_dir()
local popup_ = awful.popup({
	widget = {
		{
			{
				image = config_path .. "/pic/lily58_thaiV3.png",
				resize = true,
				widget = wibox.widget.imagebox,
				forced_height = 220,
				forced_width = 700,
			},
			layout = wibox.layout.flex.horizontal,
		},
		margins = 5,
		widget = wibox.container.margin,
	},
	screen = mouse.screen,
	border_color = "#ff6e67",
	border_width = 4,
	opacity = 0.90,
	--placement = awful.placement.bottom_left,
	shape = gears.shape.rect,
  hide_on_right_click = true,
	visible = false,
	ontop = true,
})
local function lily58_th()
--  awful.spawn.easy_async(
--    [[bash -c "setxkbmap -query |grep layout| awk '{print($2)}'"]],
--    function(stdout, stderr, reason, exit_code)
--      if tostring(stdout):sub(1,-2) == "dvorak" then
--        popup_.visible=true 
--      else
--        popup_.visible=false 
--      end
--    end
--  )
  awful.placement.top_left(popup_, {  parent = awful.screen.focused() })
  popup_.visible=not popup_.visible
end

local rt = {
	lily58_th = lily58_th,
}
return rt
