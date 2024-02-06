-- LSP Support
return {
    -- LSP Configuration
    "neovim/nvim-lspconfig",
    -- event = "VeryLazy",
    cmd = { 'LspInfo', 'LspInstall', 'LspStart', 'Mason' },
    event = { 'BufReadPost' },
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
                "biome",
                "vls",
                "pyright",
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
        lspconfig.clangd.setup({
            cmd =
            { "D:/mingw64/bin/clangd.exe",
                "--completion-style=detailed",
                "--all-scopes-completion"
            },
            -- on_attach = function(client)
            --     client.server_capabilities.documentFormattingProvider = false
            --     client.server_capabilities.documentRangeFormattingProvider = false
            -- end
        })
        lspconfig.html.setup({})
        lspconfig.cssls.setup({})
        lspconfig.tsserver.setup({})
        lspconfig.pyright.setup({})
        lspconfig.vls.setup({
            cmd = { "C:/Users/Moderator/AppData/Local/nvim-data/mason/bin/vls.cmd" },
            -- filetypes = { "v", "vlang" },
            -- root_dir = require('lspconfig.util').root_pattern("v.mod", ".git")
        })
        vim.cmd([[au BufNewFile,BufRead *.v set filetype=vlang]])
        -- vim.o.completeopt = "menuone,noinsert,noselect"
        -- vim.opt.shortmess = vim.opt.shortmess + "c"
        -- vim.diagnostic.config({
        --     update_in_insert = true,
        --     virtual_text = false,
        --     float =
        --     {
        --         border = "rounded",
        --         style = "minimal",
        --         source = "always",
        --         header = "",
        --         prefix = ""
        --     }

        -- })
        Diagnostics = {
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
        }
        -- vim.o.updatetime = 250
        vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
        vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335 guifg=#abb2bf]]
        Inlay_hints = { enabled = true }
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
}
