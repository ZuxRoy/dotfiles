"-----basic settings-----"
set nu
set relativenumber
set cursorline
set nowrap

"-----tabs-----"
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

"-----wildmenu-----"
set wildmenu
set wildmode=list:longest

"-----color-----"
highlight LineNr 	      cterm=NONE term=bold ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
hi 	      CursorLine      cterm=NONE
hi 	      CursorLineNr    cterm=bold term=bold gui=bold

"-----plugin source-----"
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

"-----key remaps-----"
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-a> :Files ~<CR>
nnoremap <silent> <C-r> :Rg<CR>

"-----settings-----"
let g:netrw_banner = 0
let g:fzf_vim = {}
let g:fzf_layout = { 'down': '~40%' }
"let g:fzf_action = { 'enter': 'tab split' }

"-----scripts-----"
