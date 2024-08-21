return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    auto_install = true,
    config = function()
        require("nvim-treesitter.configs").setup({
           ensure_installed = { "c", "bash", "regex", "jsdoc", "typescript", "ocaml", "go", "lua", "vim", "vimdoc", "query", "javascript", "html" },
           highlight = { enable = true },
           indent = { enable = true },  
        })
    end
}
