require("zuxroy.set")

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { noremap = true, silent = true })
vim.g.user_emmet_leader_key = '<Tab><CR>'
vim.g.user_emmet_mode = 'i'
vim.opt.clipboard:append("unnamedplus")

vim.cmd[[colorscheme dracula]]
vim.cmd('highlight Normal guibg=#000000')
vim.cmd('highlight SignColumn guibg=#000000')
vim.cmd('highlight LineNr term=bold ctermfg=DarkGrey ctermbg=NONE gui=NONE ')
vim.cmd [[autocmd FileType * EmmetInstall]]

-- cpp files competitive programming setup
function CompileCppFile()
  local filename = vim.api.nvim_buf_get_name(0)
  local basename = vim.fn.fnamemodify(filename, ':t:r')
  local command = 'g++ -o ' .. basename .. '.out ' .. filename
  vim.cmd('! ' .. command)
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cpp',
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<F1>', ':lua CompileCppFile()<CR>', { noremap = true, silent = true })
  end
})
