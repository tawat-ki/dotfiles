--------------
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")
require("deboost.spawn_prog")
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")
-- for debug
function debug_terminal(s)
	local buff_str = " kitty -e bash -c 'echo \"" .. tostring(s) .. "\" & sleep 1h'"
	awful.util.spawn(buff_str)
end
-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")
local config_path = gears.filesystem.get_configuration_dir()

-- This is used later as the default terminal and editor to run.
terminal = "kitty"
editor = os.getenv("EDITOR") or "nvim"
--editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
local modkey = "Mod4"
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
	awful.layout.suit.tile,
	--  awful.layout.suit.tile.left,
	--  awful.layout.suit.tile.bottom,
	--  awful.layout.suit.tile.top,
	--  awful.layout.suit.fair,
	--  awful.layout.suit.fair.horizontal,
	awful.layout.suit.spiral,
	--  awful.layout.suit.spiral.dwindle,
	--  awful.layout.suit.max,
	--  awful.layout.suit.max.fullscreen,
	--  awful.layout.suit.magnifier,
	--    awful.layout.suit.corner.nw,
	--    awful.layout.suit.corner.ne,
	awful.layout.suit.floating,
	--    awful.layout.suit.corner.sw,
	--  awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

mymainmenu =
	awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon }, { "open terminal", terminal } } })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)

local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

--require("deboost.b550_widget")
local my_widget = require("deboost.widget")
awful.screen.connect_for_each_screen(function(s)
	-- Each screen has its own tag table.
	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,

	})
	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
    style    = {
        shape_border_width = 1.5,
        shape_border_color = '#aaaaaa',
        shape  = gears.shape.rounded_bar,
        --disable_task_name=true,
    },
    layout   = {
        spacing = 10,
        spacing_widget = {
            {
                forced_width = 5,
                shape        = gears.shape.circle,
                widget       = wibox.widget.separator
            },
            valign = 'center',
            halign = 'center',
            widget = wibox.container.place,
        },
        max_widget_size=150,
        layout  = wibox.layout.flex.horizontal
        --force_width=30,
        --layout  =wibox.layout.fixed.horizontal
    },
	})
	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s ,height=17})
	-- Add widgets to the wibox
  if s.index==1 then
    set_wallpaper(s)
		gears.wallpaper.maximized(config_path.."pic/wallpaper/base.png", s, true)
    s.mywibox:setup({
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        --  mylauncher,
        s.mytaglist,
        s.mypromptbox,
        wibox.widget.textbox("| "),
      },
      s.mytasklist, -- Middle widget
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        my_widget.main,
        s.mylayoutbox,
      },
    })
    awful.tag({ "1", "2","3", "4", "5"}, s, awful.layout.layouts[1])

  else
    awful.tag({ "Main", "Code","IDK", "Notes", "Awful"}, s, awful.layout.layouts[1])
		gears.wallpaper.maximized(config_path.."pic/wallpaper/base-vertical.png", s, true)
    s.mywibox:setup({
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        --  mylauncher,
        s.mytaglist,
        s.mypromptbox,
      },

      s.mytasklist, -- Middle widget
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        mykeyboardlayout,
        wibox.widget.systray(),
        mytextclock,
        s.mylayoutbox,
      },
    })
  end
end)
-- }}}
-- Set keys
local keymap = require("deboost.keymap")
root.keys(keymap.globalkeys)
-- }}}

local clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)
-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			--focus = awful.client.focus.filter,
      focus=true,
			raise = true,
			keys = keymap.clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	},

	-- Add titlebars to normal clients and dialogs
	{ rule_any = { type = { "normal", "dialog" } }, properties = { titlebars_enabled = false } },

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	if not awesome.startup then
		awful.client.setslave(c)
	end

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = gears.table.join(
		awful.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	awful.titlebar(c):setup({
		{ -- Left
			awful.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout = wibox.layout.fixed.horizontal,
		},
		{ -- Middle
			{ -- Title
				align = "center",
				widget = awful.titlebar.widget.titlewidget(c),
			},
			buttons = buttons,
			layout = wibox.layout.flex.horizontal,
		},
		{ -- Right
			awful.titlebar.widget.floatingbutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.stickybutton(c),
			awful.titlebar.widget.ontopbutton(c),
			awful.titlebar.widget.closebutton(c),
			layout = wibox.layout.fixed.horizontal(),
		},
		layout = wibox.layout.align.horizontal,
	})
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
end)
-- }}}
local specialChars = {
  [' '] = '[SPACE]',
  ['!'] = '[EXCLAMATION_MARK]',
  ['"'] = '[DOUBLE_QUOTE]',
  ['#'] = '[HASH]',
  ['$'] = '[DOLLAR]',
  ['%'] = '[PERCENT]',
  ['&'] = '[AMPERSAND]',
  ["'"] = '[SINGLE_QUOTE]',
  ['('] = '[LEFT_PARENTHESIS]',
  [')'] = '[RIGHT_PARENTHESIS]',
  ['*'] = '[ASTERISK]',
  ['+'] = '[PLUS]',
  [','] = '[COMMA[',
  ['-'] = '[HYPHEN]',
  ['.'] = '[PERIOD]',
  ['/'] = '[SLASH]',
  [':'] = '[COLON]',
  [';'] = '[SEMICOLON]',
  ['<'] = '[LESS_THAN]',
  ['='] = '[EQUALS]',
  ['>'] = '[GREATER_THAN]',
  ['?'] = '[QUESTION_MARK]',
  ['@'] = '[AT]',
  ['['] = '[LEFT_BRACKET]',
  [']'] = '[RIGHT_BRACKET]',
  ['\\'] ='[BACKSLASH]',
  ['^'] = '[CARET]',
  ['_'] = '[UNDERSCORE]',
  ['`'] = '[BACKTICK]',
  ['{'] = '[LEFT_BRACE]',
  ['|'] = '[PIPE]',
  ['}'] = '[RIGHT_BRACE]',
  ['~'] = '[TILDE]',
}
local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ',\n'
      end
      return s .. '} '
   else
      if type(o)== "string" then
        return (tostring(o):gsub('[^%a]', function(char)
          local charName = specialChars[char]
          return charName or "[IDK]" end))
      elseif  type(o)=="number" then
        return tostring(o)
      --else
      --  return "IDK what it is"
      end
      return "__"..type(o).."__"
   end
end
print=debug_terminal
function naughty.config.notify_callback(args)
  local dump_args=dump(args)
  local log_str="normal:"..dump_args.."\n----------------------------------------\n"
  awful.spawn("bash -c 'echo \""..log_str.. "\" >> ./my_log/naughty.log'")
  if args.appname == "teams-for-linux" then
    --debug_terminal("notify from teams;try change timeout")
    args.timeout=0
    args.preset.timeout=0
    args.position="top_middle"
  end
  if args.appname=="notify-send" then
    awful.spawn("mpg123 " .. config_path .. "bin/tuturu.mp3")
    if not string.find(args.text,"!!!") then
      args.timeout=0
      args.preset.timeout=0
    end
	end
  dump_args=dump(args)
  log_str="modified:"..dump_args.."\n========================================\n"
  awful.spawn("bash -c 'echo \""..log_str.. "\" >> ./my_log/naughty.log'")
  --sep between log
  --awful.spawn("bash -c 'echo \"manual  :"..args.preset.timeout..","..args.timeout.. "\" >> naughty.log'")
	return args
end

gears.timer({
  timeout = 1200,
  call_now = true,
  autostart = true,
  callback = function()
    awful.spawn("notify-send -u critical -t 5000  'Take an eyes break!!!'")
    gears.timer({
      timeout = 21,
      call_now = false,
      autostart = true,
      single_shot = true,
      callback = function()
        awful.spawn("notify-send -u critical -t 1000  '!!!'")
      end,
    })
  end,
})
--gears.timer({
--  timeout = 3600,
--  call_now = false,
--  autostart = true,
--  callback = function()
--    awful.spawn("notify-send -u critical  -t 5000 'Stay hydrated!!'")
--  end,
--  })
