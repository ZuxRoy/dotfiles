vim.keymap.set("n", "<leader>sv", "<C-w>v", {})
vim.keymap.set("n", "<leader>sh", "<C-w>s", {})
vim.keymap.set("n", "<leader>se", "<C-w>=", {})
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", {})

vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>")

vim.keymap.set("n", "<leader>e", ":Ex<CR>", { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.keymap.set('n', '<F1>', '<cmd>!g++ -o %:r %<CR>', { noremap = true, silent = true, buffer = true })
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "sh",
  callback = function()
    vim.keymap.set('n', '<F1>', '<cmd>!chmod +x %<CR>', { noremap = true, silent = true, buffer = true })
  end
})

