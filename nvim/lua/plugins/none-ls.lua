return {
  "nvimtools/none-ls.nvim",
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
	  lsp_attach = function(client, bufnr)
		   if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    vim.lsp.buf.formatting_sync()
                end,
			})
		end
	end,
    })
  end,
}
