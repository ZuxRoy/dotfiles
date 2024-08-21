return {
    'ThePrimeagen/harpoon',
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        local tmux = require("harpoon.tmux")

        vim.keymap.set('n', '<leader>a', mark.add_file)
        vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

        vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end)
        vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end)
        vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end)
        vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end)

        --control tmux navigation using harpoon still needs work to implement open new window if not open feature figure out the script
        --vim.keymap.set('n', '<leader>t', function() tmux.gotoTerminal("{down-of}") end)
        --vim.keymap.set('n', '<leader>t', function() tmux.gotoTerminal(1) end)
    end,
}
