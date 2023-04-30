local gears = require("gears")
local wibox = require("wibox")
local config_path = gears.filesystem.get_configuration_dir()
local volume = wibox.widget.textbox("󰕾")
volume.font = "Hack 12"
local sun = wibox.widget.textbox("盛")
sun.font = "Hack 12"
local ret = {
  volume=volume,
  sun=sun,
	gpu0_icon = wibox.widget({
		image = config_path .. "/pic/gpu4.png",
		resize = true,
		widget = wibox.widget.imagebox,
	}),
	gpu1_icon = wibox.widget({
		image = config_path .. "/pic/gpu3.png",
		resize = true,
		widget = wibox.widget.imagebox,
	}),
	ram_icon = wibox.widget({
		image = config_path .. "/pic/ram1.png",
		resize = true,
		widget = wibox.widget.imagebox,
	}),
	cpu_icon = wibox.widget({
		image = config_path .. "/pic/cpu1.png",
		resize = true,
		widget = wibox.widget.imagebox,
	}),
	ethernet_icon = wibox.widget({
		image = config_path .. "/pic/ethernet3.png",
		resize = true,
		widget = wibox.widget.imagebox,
	}),
	cpu_text = wibox.widget({
		markup = "<span foreground='#bd93f9'><b>CPU</b></span>",
		widget = wibox.widget.textbox,
	}),
	gpu_text = wibox.widget({
		markup = "<span foreground='#bd93f9'><b>GPU</b></span>",
		widget = wibox.widget.textbox,
	}),
	ram_text = wibox.widget({
		markup = "<span foreground='#bd93f9'><b>RAM</b></span>",
		widget = wibox.widget.textbox,
	}),
	vram_text = wibox.widget({
		markup = "<span foreground='#bd93f9'><b>VRAM</b></span>",
		widget = wibox.widget.textbox,
	}),
}
return ret
