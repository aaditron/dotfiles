---@diagnostic disable-next-line: undefined-global
local hl = hl
-- ==================
-- MONITOR CONFIG
-- ==================

hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = 1.0,
})

-- ===================
--   ENVIRONMENT VARS
-- ===================

hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_QPA_PLATFORMTHEME_QT6", "qt6ct")
hl.env("TERMINAL", "kitty")

-- ============
--   AUTOSTART
-- ============

hl.on("hyprland.start", function()
  hl.exec_cmd("dms run")
  hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
  hl.exec_cmd("[workspace special:scratchpad silent] zen-browser --new-window about:blank")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("kdeconnectd")
  --  hl.exec_cmd("bash -c 'wl-paste --watch cliphist store &'")
end)


hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

------------
-- CONFIG
------------

hl.config({

  ---INPUT

  input = {
    kb_layout = "us,gb",
    kb_options = "caps:escape,grp:shifts_toggle",
    follow_mouse = 2,
    float_switch_override_focus = 0,
    mouse_refocus = false,
    sensitivity = 0,
    touchpad = {
      natural_scroll = true,
    },
  },

  ---GENERAL

  general = {
    gaps_in = 5,
    gaps_out = 7,
    border_size = 0,

    resize_on_border = false,
    allow_tearing = false,

    col = {
      active_border = 0x707070ff,
      inactive_border = 0xd0d0d0ff,
    },

    layout = "dwindle",
  },

  dwindle = {
    preserve_split = true,
  },

  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    vrr = 1,
  },

  ---DECORATION

  decoration = {
    rounding = 12,
    active_opacity = 1.0,
    inactive_opacity = 0.8,

    ---BLUR

    blur = {
      enabled = true,
      size = 10,
      passes = 3,
      noise = 0.04,
      contrast = 1.25,
    },

    ---SHADOW

    shadow = {
      enabled = true,
      range = 30,
      render_power = 5,
      offset = "0 5",
      color = 0x80000000,
    },
  },

  binds = {
    workspace_back_and_forth = 1,
  },

  ---ANIMATIONS

  animations = {
    enabled = true,
  },

})

hl.curve("bounce", { type = "bezier", points = { { 0.34, 1.35 }, { 0.64, 0.95 } } })

-- hl.animation({ leaf = "global", enabled = true, speed = 5, bezier = "bounce" })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "bounce" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "bounce" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "bounce" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "bounce" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "default" })

----------------
---WINDOW RULES
----------------

hl.window_rule({
  name = "nautilus",
  match = {
    class = "org.gnome.Nautilus"
  },
  float = true,
})

hl.window_rule({
  name = "xdg-desktop-portal",
  match = {
    class = "xdg-desktop-portal"
  },
  float = true,
})

hl.window_rule({
  name = "PiP",
  match = {
    title = "Picture-in-Picture"
  },
  float = true,
  pin = true,
  move = "200 200",
  keep_aspect_ratio = true,
})

hl.window_rule({
  name = "Remote",
  match = {
    title = "KDE Connect Daemon"
  },
  no_blur = true,
  float = true,
  size = "1920 1080",
  suppress_event = "fullscreen",
})

----------------
---LAYER RULES
----------------

hl.layer_rule({
  match = { namespace = "dms:bar" },
  blur = true,
  ignore_alpha = 0.5,
})

hl.layer_rule({
  match = { namespace = "quickshell" },
  no_anim = true,
})

-- =============
--  DMS BINDS
-- ==============

hl.bind("SUPER + ALT + L", hl.dsp.exec_cmd("dms ipc call lock lock"))
hl.bind("SUPER + M", hl.dsp.exec_cmd("dms ipc call processlist toggle"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("dms ipc call notifications toggle"))
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("dms ipc call notepad toggle"))
hl.bind("SUPER + TAB", hl.dsp.exec_cmd("dms ipc call hypr toggleOverview"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind("SUPER + Y", hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"))
hl.bind("SUPER + COMMA", hl.dsp.exec_cmd("dms ipc call settings toggle"))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd("dms ipc call processlist toggle"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("dms ipc call audio decrement 3"), { repeating = true, locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("dms ipc call audio increment 3"), { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("dms ipc call audio micmute"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("dms ipc call audio mute"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("dms ipc call audio mute"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("dms ipc call brightness decrement 5 ''"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("dms ipc call brightness increment 5 ''"))

-- ========
--   BINDS
-- ========

hl.bind("SUPER + SHIFT + Q", hl.dsp.exit())
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("kitty"))


for i = 1, 9 do
  hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + X", hl.dsp.workspace.toggle_special("scratchpad"))

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

----------------
--WINDOW BINDS
----------------
hl.bind("SUPER + Q", hl.dsp.window.close())
-- hl.bind("SUPER + SHIFT + 1", hl.dsp.move({ workspace = 1 }))
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus --new-window"))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("ALT + Tab", function()
  hl.dispatch(hl.dsp.window.cycle_next())
  hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + MINUS", hl.dsp.window.resize({ x = -40, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + EQUAL", hl.dsp.window.resize({ x = 40, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + MINUS", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + EQUAL", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + H", hl.dsp.window.resize({ x = -40, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + J", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + K", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + L", hl.dsp.window.resize({ x = 40, y = 0, relative = true }), { repeating = true })

hl.bind("SUPER + B", hl.dsp.exec_cmd("zen-browser"))
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind("SUPER + P", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("SUPER + SHIFT + S",
  hl.dsp.exec_cmd("grimblast copysave area -n '/home/aadit/Pictures/Screenshots/$(date +%Y%m%d_%H%M%S).png'"))
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("hyprctl dispatch dpms off"))
hl.bind("SUPER + CTRL + P", hl.dsp.exec_cmd("hyprctl dispatch dpms on"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + T", hl.dsp.window.float({ action = "toggle" }))
