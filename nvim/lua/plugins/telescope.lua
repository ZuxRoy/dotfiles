return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            'folke/todo-comments.nvim',
        },
        config = function()
            require("telescope").setup ({
              extensions = {
                ["ui-select"] = {
                  require("telescope.themes").get_dropdown {}
                }
              }
            })
            require("telescope").load_extension("ui-select")
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>ft', "<cmd>TodoTelescope<CR>", {})
        end,
    }
}
