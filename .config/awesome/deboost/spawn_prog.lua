local awful = require("awful")
awful.spawn("picom")
awful.spawn.with_shell("xset s off")
awful.spawn.with_shell("xset -dpms")
awful.spawn.with_shell("xset s noblank")
function os.capture(cmd, raw)
	local f = assert(io.popen(cmd, "r"))
	local s = assert(f:read("*a"))
	f:close()
	if raw then
		return s
	end
	s = string.gsub(s, "^%s+", "")
	s = string.gsub(s, "%s+$", "")
	s = string.gsub(s, "[\n\r]+", " ")
	return s
end
--radeon-profile
--local is_rp_exist= os.capture(" ps aux|grep radeon-profile| grep -v grep|grep -v daemon | awk 'NR==1 {print(length())}'")
--if(is_rp_exist==nil or is_rp_exist=="") then
--    awful.spawn.with_shell("radeon-profile")
--end
--end radeon-profile
local is_ksnip_exist = os.capture(" ps aux|grep ksnip| grep -v grep |awk 'NR==1 {print(length())}'")
if is_ksnip_exist == nil or is_ksnip_exist == "" then
	awful.spawn.with_shell("ksnip")
end
local is_udiskie_exist = os.capture(" ps aux|grep udiskie| grep -v grep |awk 'NR==1 {print(length())}'")
if is_udiskie_exist == nil or is_udiskie_exist == "" then
	awful.spawn.with_shell("udiskie")
end
awful.spawn.with_shell("play-with-mpv")
--disable kde shortcut
awful.spawn.with_shell("qdbus org.kde.kglobalaccel /kglobalaccel blockGlobalShortcuts true")
awful.spawn.with_shell("xset s off")
awful.spawn.with_shell("xset -dpms")
awful.spawn.with_shell("xset s noblank")
awful.spawn.with_shell("xset s noblank")
--awful.spawn.with_shell("lxsession")
