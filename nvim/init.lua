vim.loader.enable()
-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- This has to be set before initializing lazy
vim.g.mapleader = " "
-- Initialize lazy with dynamic loading of anything in the plugins directory
require("lazy").setup("plugins", {
    change_detection = {
        enabled = true, -- automatically check for config file changes and reload the ui
        notify = false, -- turn off notifications whenever plugin changes are made
    },
})
if vim.g.neovide then
    vim.g.neovide_no_idle = true
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_cursor_antialiasing = false
    vim.g.neovide_fullscreen = false
    vim.o.guifont = "CaskaydiaCove Nerd Font:h13"
    vim.keymap.set("v", "<C-c>", '"+y')         -- Copy
    vim.keymap.set("n", "<C-v>", '"+P')         -- Paste normal mode
    vim.keymap.set("v", "<C-v>", '"+P')         -- Paste visual mode
    vim.keymap.set("c", "<C-v>", "<C-R>+")      -- Paste command mode
    vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode
end
-- These modules are not loaded by lazy
require("core.options")
require("core.keymaps")

