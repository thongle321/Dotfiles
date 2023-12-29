-- LSP Support
return {
  -- LSP Configuration
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    -- LSP Manager Plugins
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

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
    lspconfig.tsserver.setup({
      preferences = {
        disableSuggestions = true,
      },
    })
    lspconfig.pylsp.setup({
      filetypes = { "python" },
    })
  end,
}
