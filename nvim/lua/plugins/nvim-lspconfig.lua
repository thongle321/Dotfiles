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
        { "folke/neodev.nvim",                opts = {} },
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
            update_in_insert = true,
            virtual_text = false,
            float =
            {
                border = "rounded",
                style = "minimal",
                source = "always",
                header = "",
                prefix = ""
            }

        })
        vim.o.updatetime = 250
        vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
        vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335 guifg=#abb2bf]]
    end,
    ft = {
        "html",
        "css",
        "cpp",
        "c",
        "py",
        "js",
        "ts",
    },
    diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = "●",
            -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
            -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
            -- prefix = "icons",
        },
        severity_sort = true,
    },
    inlay_hints = {
        enabled = false,
    },
    -- add any global capabilities here
    capabilities = {},
    -- options for vim.lsp.buf.format
    -- `bufnr` and `filter` is handled by the LazyVim formatter,
    -- but can be also overridden when specified
    format = {
        formatting_options = nil,
        timeout_ms = nil,
    },
}
