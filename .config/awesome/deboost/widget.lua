local icon = require("deboost.icon")
local naughty = require("naughty")
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")
local config_path = gears.filesystem.get_configuration_dir()
local net_speed_widget = require("awesome-wm-widgets.net-speed-widget.net-speed")
local run_shell = require("awesome-wm-widgets.run-shell.run-shell")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local capslock_aA, capslock_aA_timer = awful.widget.watch(config_path .. "/bin/caps", 0.5)
local volume_val, volume_timer =
	awful.widget.watch([[bash -c "amixer -D pulse sget Master |grep Left:|awk '{printf\"%.2f\",substr($5,2,length($5)-3)}'"]], 1)

local net_section = wibox.container({
	awful.widget.watch([[bash -c "iwgetid -r"]]),
	net_speed_widget(),
	wibox.widget.textbox(" | "),
	layout = wibox.layout.fixed.horizontal,
})
local cpu_section = wibox.container({
	icon.coloredText("CPU"),
	cpu_widget(),
	wibox.widget.textbox(" "),
	awful.widget.watch(
  --[[bash -c "cat /sys/class/thermal/thermal_zone*/temp |awk NR==1'{printf(\"%.1f°C\",$0/1000)}' "]]
    [[bash -c "cat /sys/devices/*/*/*/*/temp*_input |awk NR==1'{printf(\"%.1f°C\",$0/1000)}' "]],
		w1
	),
	wibox.widget.textbox(" | "),
	layout = wibox.layout.fixed.horizontal,
})
local ram_section = wibox.container({
	--ram_icon,
	icon.coloredText("RAM"),
	awful.widget.watch([[bash -c "free | grep Mem |awk '{printf(\" %.1f%%\",$3/$2*100)}'"]], 1),
	wibox.widget.textbox(" | "),
	layout = wibox.layout.fixed.horizontal,
})
local gpu_section = wibox.container({
	icon.coloredText("GPU"),
	wibox.widget.textbox(" "),
	awful.widget.watch(
		[[bash -c "nvidia-settings -q GPUUtilization  |grep memory |awk 'NR==1{printf(\"%0.1f%%\",substr($4,10))}'"]],
		3
	),
	awful.widget.watch(
		[[bash -c "nvidia-settings -q gpucoretemp  | grep B550 | awk 'NR==1{ printf(\" %0.1f °C\", $4);}'"]],
		4
	),
	wibox.widget.textbox(" "),
	icon.coloredText("VRAM"),
	wibox.widget.textbox(" "),
	awful.widget.watch(
		[[bash -c "nvidia-settings -q [gpu:0]/useddedicatedgpumemory  |grep B550 |awk '{printf(\"%0.1f%%\",substr($4,1,length($4)-1)/80)}'"]],
		5
	),
	wibox.widget.textbox(" | "),
	layout = wibox.layout.fixed.horizontal,
})
local main_widget = wibox.container({
	wibox.widget.textbox(" | "),
	net_section,
	cpu_section,
	ram_section,
	gpu_section,
	icon.volume,
	volume_val,
	wibox.widget.textbox(" |"),
	capslock_aA,
	mykeyboardlayout,
	wibox.widget.systray(),
	mytextclock,
	layout = wibox.layout.fixed.horizontal,
})
local rt = {
	main = main_widget,
	volume_timer = volume_timer,
	capslock_aA_timer = capslock_aA_timer,
	--  update_caps=update_caps,
}
return rt
