vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("", "<leader>", Trim__save__no_highlight)
keymap.set("", "U", Trim__save__format)

keymap.set("n", "gD", Reveal_definition_aside)
keymap.set("n", "gt", Go_to_implementation)
keymap.set("n", "gq", Go_to_reference)
keymap.set("n", ",r", Rename_symbol)
keymap.set("n", "<<", Outdent)
keymap.set("n", ">>", Indent)
keymap.set("n", "gcc", Comment)
keymap.set("n", "=s", Convert_to_spaces)
keymap.set("n", "=t", Convert_to_tabs)
keymap.set("n", "=d", Indent_with_spaces)
keymap.set("n", "=g", Indent_with_tabs)
keymap.set("n", "K", CloseEditor)
keymap.set("n", ",K", UndoCloseEditor)
keymap.set("n", "zk", Git_stage_file)
keymap.set("n", "zK", Git_unstage_file)
keymap.set("n", "zi", Git_open_changes)
keymap.set("n", "zI", Git_open_all_changes)
keymap.set("n", "zy", Toggle_breakpoint)
keymap.set("n", "yr", Copy_relative_path)
keymap.set("n", "yR", Copy_path)

keymap.set("v", "gs", Codesnap)
keymap.set("v", "<", Outdent_vis)
keymap.set("v", ">", Indent_vis)
keymap.set("v", "gc", Comment_vis)

keymap.set({ "n", "v" }, "zJ", Git_revert_change)
keymap.set({ "n", "v" }, "zj", Git_stage_change)
