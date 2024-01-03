return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.biome,
        --null_ls.builtins.diagnostics.biome,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.formatting.black,
      },
    })
  end,
}
