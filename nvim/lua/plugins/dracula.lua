return {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("dracula").setup({
            colors = {
                bg = "#000000",
            },
            transparent_bg = true,
            lualine_bg_color = "#000000",
        })
        vim.cmd[[colorscheme dracula]]
        vim.cmd[[highlight Pmenu guibg=#000000]]
    end,
}
