-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap
-- General keymaps
keymap.set("i", "jk", "<ESC>")                                       -- exit insert mode with jk
keymap.set("i", "ii", "<ESC>")                                       -- exit insert mode with ii
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Save and Quit" }) -- save and quit
keymap.set("n", "<leader>wx", ":q!<CR>", { desc = "Quit" })
keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Save" })           -- save

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Window Vertical" })       -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Window Horizontall" })    -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Window Equal" })          -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close Window" })      -- close split window
keymap.set("n", "<leader>sj", "<C-w>-", { desc = "Window Height Shorter" }) -- make split window height shorter
keymap.set("n", "<leader>sk", "<C-w>+", { desc = "Window Height Taller" })  -- make split windows height taller
keymap.set("n", "<leader>sl", "<C-w>>5", { desc = "Window Height +" })      -- make split windows width bigger
keymap.set("n", "<leader>sh", "<C-w><5", { desc = "Window Height -" })      -- make split windows width smaller

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "New Tab" })     -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close Tab" }) -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Next Tab" })      -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Previous Tab" })  -- previous tab

-- Quickfix keymaps
keymap.set("n", "<leader>qn", ":cnext<CR>", { desc = "Next error" })     -- jump to next quickfix list item
keymap.set("n", "<leader>qp", ":cprev<CR>", { desc = "Previous error" }) -- jump to prev quickfix list item

-- Telescope
keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Search Files" })
keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Search by Grep" })
keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Search Buffers" })
keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Search Help" })
keymap.set("n", "<leader>f<s-S>", require("telescope.builtin").grep_string, { desc = "Search current Word" })
keymap.set("n", "<leader>fs", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "Search Fuzzy" })
keymap.set("n", "<leader>fo", require("telescope.builtin").lsp_document_symbols, { desc = "Search LSP Symbols" })
keymap.set("n", "<leader>fi", require("telescope.builtin").lsp_incoming_calls, { desc = "Search LSP Calls" })
keymap.set("n", "<leader>fm", function()
    require("telescope.builtin").treesitter({ default_text = ":method:" })
end)

-- Harpoon
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "Mark Files" })
keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu, { desc = "File Navigation" })
keymap.set("n", "<leader>h1", function()
    require("harpoon.ui").nav_file(1)
end)
keymap.set("n", "<leader>h2", function()
    require("harpoon.ui").nav_file(2)
end)
keymap.set("n", "<leader>h3", function()
    require("harpoon.ui").nav_file(3)
end)
keymap.set("n", "<leader>h4", function()
    require("harpoon.ui").nav_file(4)
end)
keymap.set("n", "<leader>h5", function()
    require("harpoon.ui").nav_file(5)
end)
keymap.set("n", "<leader>h6", function()
    require("harpoon.ui").nav_file(6)
end)
keymap.set("n", "<leader>h7", function()
    require("harpoon.ui").nav_file(7)
end)
keymap.set("n", "<leader>h8", function()
    require("harpoon.ui").nav_file(8)
end)
keymap.set("n", "<leader>h9", function()
    require("harpoon.ui").nav_file(9)
end)
keymap.set("n", "<leader>hn", require("harpoon.ui").nav_next, { desc = "Next Mark" })
keymap.set("n", "<leader>hp", require("harpoon.ui").nav_prev, { desc = "Previous Mark" })

-- LSP
keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover" })
keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Definition" })
keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Declaration" })
keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Implementation" })
keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "Type definition" })
keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "References" })
keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature help" })
keymap.set("n", "<leader>g<s-R>", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
keymap.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", { desc = "Format" })
keymap.set("v", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", { desc = "Format" })
keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Diagnostic" })
keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Diagnostic previous" })
keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Diagnostic next" })
keymap.set("n", "<leader>g<s-T>", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { desc = "Document symbol" })
keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>", { desc = "Completion" })

-- Nvim-dap
keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
keymap.set(
    "n",
    "<leader>dc",
    "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
    { desc = "Set Breakpoint" }
)
keymap.set(
    "n",
    "<leader>dl",
    "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
    { desc = "Breakpoint Log" }
)
keymap.set("n", "<leader>dq", "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "Clear Breakpoint" })
keymap.set("n", "<leader>da", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "List Breakpoint" })
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue" })
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step over" })
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step info" })
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step out" })
keymap.set("n", "<leader>dd", function()
    require("dap").disconnect()
    require("dapui").close()
end)
keymap.set("n", "<leader>dt", function()
    require("dap").terminate()
    require("dapui").close()
end)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Repl toggle" })
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Run last" })
keymap.set("n", "<leader>di", function()
    require("dap.ui.widgets").hover()
end)
keymap.set("n", "<leader>d?", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
end)
keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>", { desc = "Telescope frames" })
keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>", { desc = "Telescope commands" })
keymap.set("n", "<leader>de", function()
    require("telescope.builtin").diagnostics({ default_text = ":E:" })
end)
-- Trouble
keymap.set("n", "<s-T>", "<cmd>TroubleToggle<cr>")
-- Split windwos
--keymap.set("n", "<C-w>", "<cmd>wincmd w<CR>")
-- Toggle term
function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc', [[<c-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<c-\><C-n><C-W>k]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
-- Which-key
local wk = require("which-key")
wk.register({
    ["<leader>e"] = { name = "Explorer", _ = "which_key_ignore" },
    ["<leader>t"] = { name = "Tab", _ = "which_key_ignore" },
    ["<leader>f"] = { name = "Find", _ = "which_key_ignore" },
    ["<leader>fm"] = { "Search Treesitter" },
    ["<leader>w"] = { name = "Save and Quit", _ = "which_key_ignore" },
    ["<leader>d"] = { name = "Debug", _ = "which_key_ignore" },
    ["<leader>dd"] = { "Disconnect" },
    ["<leader>dt"] = { "Terminate" },
    ["<leader>di"] = { "Ui" },
    ["<leader>d?"] = { "Ui scope" },
    ["<leader>de"] = { "Diagnostics" },
    ["<leader>h"] = { name = "Harpoon", _ = "which_key_ignore" },
    ["<leader>h1"] = { "Mark 1" },
    ["<leader>h2"] = { "Mark 2" },
    ["<leader>h3"] = { "Mark 3" },
    ["<leader>h4"] = { "Mark 4" },
    ["<leader>h5"] = { "Mark 5" },
    ["<leader>h6"] = { "Mark 6" },
    ["<leader>h7"] = { "Mark 7" },
    ["<leader>h8"] = { "Mark 8" },
    ["<leader>h9"] = { "Mark 9" },
    ["<leader>s"] = { name = "Split Windows", _ = "which_key_ignore" },
    ["<leader>g"] = { name = "Lsp", _ = "which_key_ignore" },
    ["<leader>q"] = { name = "Quickfix", _ = "which_key_ignore" },
})

