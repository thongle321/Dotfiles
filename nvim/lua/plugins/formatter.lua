return {
  "mhartington/formatter.nvim",
  event = "VeryLazy",
  opts = {
    formatter_by_ft = {
      ["javascript"] = {"prettier"},
      ["typescript"] = {"prettier"},
    },
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      command = "FormatWriteLock"
    })
  }
}
