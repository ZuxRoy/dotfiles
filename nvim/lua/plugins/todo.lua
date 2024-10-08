return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        local todo = require("todo-comments")
        vim.keymap.set("n", "]t", function() todo.jump_next() end)
        vim.keymap.set("n", "[t", function() todo.jump_prev() end)
        todo.setup()
    end
}
