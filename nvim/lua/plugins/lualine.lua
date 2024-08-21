return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local colors = {
            gray       = '#44475a',
            lightgray  = '#5f6a8e',
            orange     = '#ffb86c',
            purple     = '#bd93f9',
            red        = '#ff5555',
            yellow     = '#f1fa8c',
            green      = '#50fa7b',
            white      = '#f8f8f2',
            black      = '#000000',
        }

        local custom_dracula = {
            normal = {
                a = { bg = colors.purple, fg = colors.black, gui = 'bold' },
                b = { bg = colors.lightgray, fg = colors.white },
                c = { bg = colors.black, fg = colors.white },
            },
            insert = {
                a = { bg = colors.green, fg = colors.black, gui = 'bold' },
                b = { bg = colors.lightgray, fg = colors.white },
                c = { bg = colors.black, fg = colors.white },
            },
            visual = {
                a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
                b = { bg = colors.lightgray, fg = colors.white },
                c = { bg = colors.black, fg = colors.white },
            },
            replace = {
                a = { bg = colors.red, fg = colors.black, gui = 'bold' },
                b = { bg = colors.lightgray, fg = colors.white },
                c = { bg = colors.black, fg = colors.white },
            },
            command = {
                a = { bg = colors.orange, fg = colors.black, gui = 'bold' },
                b = { bg = colors.lightgray, fg = colors.white },
                c = { bg = colors.black, fg = colors.white },
            },
            inactive = {
                a = { bg = colors.gray, fg = colors.white, gui = 'bold' },
                b = { bg = colors.lightgray, fg = colors.white },
                c = { bg = colors.black, fg = colors.white },
            },
        }
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = custom_dracula,
                component_separators = {'|'},
                section_separators = {'|'},
            },
        })
    end
}
