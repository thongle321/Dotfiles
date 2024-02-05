return {
    "nvimtools/none-ls.nvim",
    lazy = true,
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.biome,
                null_ls.builtins.diagnostics.biome,
                null_ls.builtins.diagnostics.ruff,
                null_ls.builtins.diagnostics.mypy,
                null_ls.builtins.formatting.black,
            },
        })
    end,
}
