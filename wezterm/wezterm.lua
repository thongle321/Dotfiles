local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
local config = {}
local keys = {}
local mouse_bindings = {}
local launch_menu = {}

--- Setup PowerShell options
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  --- Grab the ver info for later use.
  local success, stdout, stderr = wezterm.run_child_process { 'cmd.exe', 'ver' }
  local major, minor, build, rev = stdout:match("Version ([0-9]+)%.([0-9]+)%.([0-9]+)%.([0-9]+)")
  local is_windows_11 = tonumber(build) >= 22000
  
  --- Make it look cool.
  if is_windows_11 then
    wezterm.log_info "We're running Windows 11!"
  end

  --- Set Pwsh as the default on Windows
  config.default_prog = { 'pwsh.exe', '-NoLogo' }
  table.insert(launch_menu, {
    label = 'Pwsh',
    args = { 'pwsh.exe', '-NoLogo' },
  })
  table.insert(launch_menu, {
    label = 'PowerShell',
    args = { 'powershell.exe', '-NoLogo' },
  })
  table.insert(launch_menu, {
    label = 'Pwsh No Profile',
    args = { 'pwsh.exe', '-NoLogo', '-NoProfile' },
  })
  table.insert(launch_menu, {
    label = 'PowerShell No Profile',
    args = { 'powershell.exe', '-NoLogo', '-NoProfile' },
  })
  table.insert(launch_menu, {
	label = 'Cmd',
	args = { 'cmd.exe', '-NoLogo' },
  }) 
else
  --- Non-Windows Machine
  table.insert(launch_menu, {
    label = 'Pwsh',
    args = { '/usr/local/bin/pwsh', '-NoLogo' },
  })
  table.insert(launch_menu, {
    label = 'Pwsh No Profile',
    args = { '/usr/local/bin/pwsh', '-NoLogo', '-NoProfile' },
  })
end
keys = {
	{ key = 'l', mods = 'ALT', action = act.ShowLauncher },
}
-- Mousing bindings
mouse_bindings = {
  -- Change the default click behavior so that it only selects
  -- text and doesn't open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act.CompleteSelection 'ClipboardAndPrimarySelection',
  },

  -- and make CTRL-Click open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.OpenLinkAtMouseCursor,
  },
  {
    event = { Down = { streak = 3, button = 'Left' } },
    action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
    mods = 'NONE',
  },
}

--- Default config settings
config.scrollback_lines = 7000
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.color_scheme = 'Everforest Dark (Gogh)'
config.font = wezterm.font_with_fallback {
  {
    family = 'CaskaydiaCove Nerd Font',
	harfbuzz_features = { 'liga=1' },
  },
}
config.font_size = 13
config.launch_menu = launch_menu
config.default_cursor_style = 'SteadyBar'
config.hide_tab_bar_if_only_one_tab = true
config.keys = keys
config.mouse_bindings = mouse_bindings


return config