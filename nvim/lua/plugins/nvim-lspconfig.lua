-- LSP Support
return {
    -- LSP Configuration
    "neovim/nvim-lspconfig",
    -- event = "VeryLazy",
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        -- LSP Manager Plugins
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "nvim-java/lua-async-await" },
        -- Additional lua configuration, makes nvim stuff amazing!
        { "folke/neodev.nvim" },
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            -- Update this list to the language servers you need installed
            ensure_installed = {
                -- "bashls", # requires npm to be installed
                "html",
                "cssls",
                -- "gradle_ls",
                -- "groovyls",
                "lua_ls",
                "tsserver",
                -- "intelephense", # requires npm to be installed
                -- "jsonls", # requires npm to be installed
                -- "lemminx",
                "marksman",
                "pylsp",
                "biome",
            },
        })
        local lspconfig = require("lspconfig")
        local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lsp_attach = function(client, bufnr)
            -- Create your keybindings here...
        end

        -- Call setup on each LSP server
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    on_attach = lsp_attach,
                    capabilities = lsp_capabilities,
                })
            end,
        })

        -- Lua LSP settings
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                },
            },
        })
        lspconfig.html.setup({})
        lspconfig.cssls.setup({})
        lspconfig.tsserver.setup({})
        lspconfig.pylsp.setup({})
        
        vim.o.completeopt = "menuone,noinsert,noselect"
        vim.opt.shortmess = vim.opt.shortmess + "c"
        vim.diagnostic.config({
            virtual_text = false,
            float = { border = "rounded" }
        })

        vim.o.updatetime = 250
        vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
        vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335 guifg=#abb2bf]]
    end,

}
