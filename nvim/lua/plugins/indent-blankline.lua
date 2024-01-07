-- Indentation guides
return {
    "lukas-reineke/indent-blankline.nvim",
    --event = 'VeryLazy',
    event = {"BufReadPost"},
    main = "ibl",
    opts = {
        enabled = true,
        indent = {
            char = '|',
        },
    },
}
