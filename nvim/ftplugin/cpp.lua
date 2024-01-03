local keymap = vim.keymap
require("cmp").setup.buffer({
  completion = {
    autocomplete = false,
  },
})
function _G.check_back_space()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keymap.set(
  "i",
  "<TAB>",
  'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
  opts
)
keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
keymap.set("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- GoTo code navigation
keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })
