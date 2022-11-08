local icon = require("deboost.icon")
local naughty = require("naughty")
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local config_path = gears.filesystem.get_configuration_dir()
local net_speed_widget = require("awesome-wm-widgets.net-speed-widget.net-speed")
local run_shell = require("awesome-wm-widgets.run-shell.run-shell")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")

local capslock_aA,capslock_aA_timer = awful.widget.watch(config_path .. "/bin/caps", 0.1)

--NR==1 for aspire
local volume_val,volume_timer= awful.widget.watch([[bash -c "pactl list sinks |grep 'Volume: f'|awk 'NR==2{print($5)}'"]], 1)

local light_val,light_timer= awful.widget.watch([[bash -c "light -G | awk '{printf(\"%.1f%%\"),$1}'"]], 1)
--local caps_cmd = [[bash -c "cat /sys/class/leds/*::capslock/brightness |awk 'NR==1{printf(\"%d\",$1)} "]]
--local function update_caps()
--  awful.spawn.with_line_callback(caps_cmd, {
--    stdout = function(line)
--        capslock_num_timer:emit_signal("timeout") 
--        naughty.notify { text = "LINE:"..line }
--    end,
--    stderr = function(line)
--        naughty.notify { text = "ERR:"..line}
--    end,
--  })
--end


local b550_widget = wibox.container({
	--ethernet_icon,
	wibox.widget.textbox(" | "),
	net_speed_widget(),
	wibox.widget.textbox("| "),
	--cpu_icon,
	wibox.widget.textbox(" "),
	icon.cpu_text,
	awful.widget.watch([[bash -c "sar 1 1 |grep Average: |awk '{printf(\" %0.1f%% \",$5+$4+$3)}'"]], 2),
	cpu_widget(),
	awful.widget.watch(
		[[bash -c "cat /sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon3/temp1_input | awk '{ printf(\"  %0.1f °C\", $1/1000); }'"]],
		2
	),
	wibox.widget.textbox("  |  "),
	--ram_icon,
	icon.ram_text,
	awful.widget.watch([[bash -c "free | grep Mem |awk '{printf(\" %.1f%%\",$3/$2*100)}'"]], 2),
	wibox.widget.textbox("  |  "),
	--amd
	--gpu utilization,temp
	icon.gpu_text,
	awful.widget.watch([[bash -c "radeontop -d - -l 1 |grep gpu |awk '{print(\" \",substr($5,0,length($5)-1))}'"]], 2),
	awful.widget.watch([[bash -c "sensors |grep edge |awk '{printf(\" %0.1f°C\",substr($2,2))}'"]], 2),
	awful.widget.watch([[bash -c "radeontop -d - -l 1 |grep gpu |awk '{print(\" VRAM \", $27)}'"]], 2),

	--nvidia
	--gpu0_icon,
	--wibox.widget.textbox(" "),
	--awful.widget.watch(
	--  [[bash -c "nvidia-settings -q GPUUtilization  |grep memory |awk 'NR==1{printf(\"%0.1f%%\",substr($4,10))}'"]],
	--  2
	--),
	--awful.widget.watch(
	--  [[bash -c "nvidia-settings -q gpucoretemp  | grep B550 | awk 'NR==1{ printf(\" %0.1f °C\", $4);}'"]],
	--  2
	--),
	--awful.widget.watch(
	--  [[bash -c "nvidia-settings -q [gpu:0]/useddedicatedgpumemory  |grep B550 |awk '{printf(\"   VRAM %0.1f%%\",substr($4,1,length($4)-1)/80)}'"]],
	--  2
	--),
	--nvidia1
	--      wibox.widget.textbox('  |  '),
	--    gpu1_icon,
	--    awful.widget.watch([[bash -c "nvidia-settings -q GPUUtilization  |grep memory |awk 'NR==2{printf(\" %0.1f%%\",substr($4,10))}'"]], 2),
	--      awful.widget.watch([[bash -c "nvidia-settings -q gpucoretemp | grep B550 | awk 'NR==2{ printf(\" %0.1f °C\", $4);}'"]], 2),
	--      wibox.widget.textbox('  |  '),
	--      awful.widget.watch([[bash -c "nvidia-settings -q [gpu:1]/useddedicatedgpumemory  |grep B550 |awk '{printf(\"   VRAM %0.1f%%\",substr($4,1,length($4)-1)/120)}'"]], 2),
	wibox.widget.textbox(" | "),
	icon.volume,
	wibox.widget.textbox(" "),
	volume_val,

	wibox.widget.textbox(" | "),
	capslock_aA,
  capslock_font,
  capslock_num,
	wibox.widget.textbox("  "),
	mykeyboardlayout,
	wibox.widget.systray(),
	mytextclock,
	layout = wibox.layout.fixed.horizontal,
})
local aspire_widget = {
	wibox.widget.textbox("  |  "),
	awful.widget.watch([[bash -c "iwgetid -r"]]),
	net_speed_widget(),
	wibox.widget.textbox("|  "),
	icon.cpu_text,
	wibox.widget.textbox("  "),
	cpu_widget(),
	awful.widget.watch([[bash -c "sensors |grep Package|awk '{printf(\"   %0.1f°C  \",substr($4,2,5))}'"]]),
	awful.widget.watch([[bash -c "cat /proc/cpuinfo | grep MHz | awk '{sum+=$4}END{printf(\"%.1fMHz\"),sum/4}'"]], 1),
	wibox.widget.textbox("  |  "),
	icon.ram_text,
	wibox.widget.textbox("  "),
	awful.widget.watch([[bash -c "free | grep Mem | awk '{printf(\"%.1f%%\"),$3/$2*100}'"]], 1),
	wibox.widget.textbox("  |  "),
	icon.sun,
	awful.widget.watch([[bash -c "light -G | awk '{printf(\"%.1f%%\"),$1}'"]], 1),
	wibox.widget.textbox("  |  "),
	icon.volume,
  volume_val,
	--  brightness_widget({ type = "arc", program = "light", step = 1 }),
	--cat /proc/cpuinfo | grep MHz | awk '{sum +=$4}END{printf(" %.1fMHz"),sum/4 }'
	--volume_val,
	wibox.widget.textbox(" | "),
	capslock_aA,
	wibox.widget.textbox("  "),
	mykeyboardlayout,
	wibox.widget.systray(),
	mytextclock,
	layout = wibox.layout.fixed.horizontal,
}
local rt = {
	b550 = b550_widget,
	aspire = aspire_widget,
  volume_timer= volume_timer,
  capslock_aA_timer =capslock_aA_timer,
  light_timer =light_timer,
--  update_caps=update_caps,
}
return rt
