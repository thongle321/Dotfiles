-- Auto-completion / Snippets
return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        -- Adds LSP completion capabilities
        "hrsh7th/cmp-nvim-lsp",

        -- Adds a number of user-friendly snippets
        "rafamadriz/friendly-snippets",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local kind_icons = {
            -- Text = "",
            -- Method = "󰆧",
            -- Function = "",
            -- Constructor = "",
            -- Field = "󰇽",
            -- Variable = "",
            -- Class = "",
            -- Interface = "",
            -- Module = "",
            -- Property = "",
            -- Unit = "",
            -- Value = "󰎠",
            -- Enum = "",
            -- Keyword = "",
            -- Snippet = "",
            -- Color = "󰏘",
            -- File = "󰈙",
            -- Reference = "",
            -- Folder = "󰉋",
            -- EnumMember = "",
            -- Constant = "",
            -- Struct = "",
            -- Event = "",
            -- Operator = "",
            -- TypeParameter = "󰅲",
            Text = " ",
            Method = "󰆧 ",
            Function = " ",
            Constructor = " ",
            Field = "󰇽 ",
            Variable = " ",
            Class = " ",
            Interface = " ",
            Module = " ",
            Property = " ",
            Unit = " ",
            Value = "󰎠 ",
            Enum = " ",
            Keyword = " ",
            Snippet = " ",
            Color = "󰏘 ",
            File = "󰈙 ",
            Reference = " ",
            Folder = "󰉋 ",
            EnumMember = " ",
            Constant = " ",
            Struct = " ",
            Event = " ",
            Operator = " ",
            TypeParameter = "󰅲 ",
        }
        require("luasnip.loaders.from_snipmate").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load()
        vim.opt.completeopt = "menu,menuone,noselect"
        cmp.setup({
            window = {
                documentation = cmp.config.window.bordered(),
                completion = cmp.config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll backward
                ["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll forward
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(),        -- clear completion window
                ["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirm selection
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- lsp
                { name = "luasnip" }, -- snippets
                -- { name = "buffer" }, -- text within current buffer
                { name = "path" }, -- file system paths
            }),
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind] or "", vim_item.kind) -- This concatonates the icons with the name of the item kind
                    -- Source
                    vim_item.menu = ({
                        nvim_lsp = "(LSP)",
                        luasnip = "(LuaSnip)",
                        nvim_lua = "(Lua)",
                    })[entry.source.name]
                    return vim_item
                end,
            },
            -- formatting = {
            --     fields = { "kind", "abbr", "menu" },
            --     format = function(_, vim_item)
            --         vim_item.kind = kind_icons[vim_item.kind] or ""
            --         return vim_item
            --     end,
            -- },
        })
    end,
}
