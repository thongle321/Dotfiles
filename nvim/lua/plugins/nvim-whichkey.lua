return
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
    prefix = "",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
    expr = false, -- use `expr` when creating keymaps
    layout = {
      height = { min = 5, max = 30 }, -- min and max height of the columns
      width = { min = 25, max = 60 }, -- min and max width of the columns
      spacing = 4, -- spacing between columns
      align = "center", -- align columns left, center or right
    },
  }
}
