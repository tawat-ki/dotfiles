local awful = require("awful")
local naughty = require("naughty")
local cmd=[[bash -c " ps aux|grep udiskie| grep -v grep |awk 'NR==1 {print(length())}'"]]
awful.spawn.easy_async(cmd,function(stdout,stderr,reason,exit_code) 
  if stdout == nil or stdout == "" then
    awful.spawn.easy_async("udiskie")
  end
end)
local cmd=[[bash -c " ps aux|grep ksnip| grep -v grep |awk 'NR==1 {print(length())}'"]]
awful.spawn.easy_async(cmd,function(stdout,stderr,reason,exit_code) 
  if stdout == nil or stdout == "" then
    awful.spawn.easy_async("ksnip")
  end
end)
--awful.spawn.easy_async("play-with-mpv")
--awful.spawn.easy_async("picom")
--awful.spawn.easy_async("lxpolkit")
--awful.spawn.easy_async("xset s off")
--awful.spawn.easy_async("xset -dpms")
--awful.spawn.easy_async("xset s noblank")
--awful.spawn.easy_async("unclutter -idle 0.5")
--awful.spawn.easy_async("lxsession")
