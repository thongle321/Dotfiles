-- Fuzzy finder
return {
    'nvim-telescope/telescope.nvim',
    -- lazy = true,
    event = "VeryLazy",
    branch = '0.1.x',
    cmd = "Telescope",
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    },
    opts = {
        defaults = {
            layout_config = {
                vertical = {
                    width = 0.75
                }
            }
        }
    }
}
