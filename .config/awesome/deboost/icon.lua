local gears = require("gears")
local wibox = require("wibox")
local config_path = gears.filesystem.get_configuration_dir()
local volume = wibox.widget.textbox("󰕾")
volume.font = "Hack 12"
local sun = wibox.widget.textbox("盛")
sun.font = "Hack 12"

local function coloredText(text,color)
    color = color or '#bd93f9' 
    local text_widget = wibox.widget({
        markup = "<span foreground='".. color.."'><b>" .. text .. "</b></span>",
        widget = wibox.widget.textbox,
    })
    return text_widget
end
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
    coloredText=coloredText,
}
return ret
