-- Code Tree Support / Syntax Highlighting
return {
    "nvim-treesitter/nvim-treesitter",
    -- event = VeryLazy',
    event = { "BufNew", "BufReadPre", "InsertEnter" },
    -- event = "BufReadPost",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    opts = {
        highlight = {
            enable = true,
        },
        indent = { enable = true },
        auto_install = false, -- automatically install syntax support when entering new file type buffer
        ensure_installed = {
            "lua",
        },
    },
    config = function(_, opts)
        local configs = require("nvim-treesitter.configs")
        configs.setup(opts)
    end,
}
