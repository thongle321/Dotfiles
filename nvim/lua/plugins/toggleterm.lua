-- local powershell_options = {
--     shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "pwsh",
--     shellcmdflag =
--     "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
--     shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
--     shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
--     shellquote = "",
--     shellxquote = "",
-- }
-- for option, value in pairs(powershell_options) do
--     vim.opt[option] = value
-- end
--vim.cmd [[let &shell = "C:/Users/Moderator/Downloads/terminal-1.20.3491.0/WindowsTerminal.exe"]]
--vim.cmd [[let &shellcmdflag = '-NoLogo']]
return {
    'akinsho/toggleterm.nvim',
    version = "*",
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    opts = {
        size = 10,
        shell = "pwsh.exe",
        open_mapping = [[<c-\>]],
        autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
        start_in_insert = true,
        direction = 'float',
        close_on_exit = true, -- close the terminal window when the process exits
        -- Change the default shell. Can be a string or a function returning a string
        -- shell = vim.o.shell,
        auto_scroll = true, -- automatically scroll to the bottom on terminal output
    }
}
