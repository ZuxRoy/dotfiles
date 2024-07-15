require("zuxroy.set")

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { noremap = true, silent = true })
vim.g.user_emmet_leader_key = '<Tab><CR>'
vim.g.user_emmet_mode = 'i'

vim.cmd[[colorscheme dracula]]
vim.cmd('highlight Normal guibg=#000000')
vim.cmd('highlight SignColumn guibg=#000000')
vim.cmd('highlight LineNr term=bold ctermfg=DarkGrey ctermbg=NONE gui=NONE ')
vim.cmd [[autocmd FileType * EmmetInstall]]
