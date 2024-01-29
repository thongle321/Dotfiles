-- Indentation guides
return {
    "lukas-reineke/indent-blankline.nvim",
    --event = 'VeryLazy',
    event = {"BufReadPre", "BufNewFile"},
    main = "ibl",
    opts = {
        enabled = true,
        indent = {
            char = '|',
        },
    },
}
