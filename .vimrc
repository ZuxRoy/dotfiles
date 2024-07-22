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
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## ff6e0fdc23429f233054d16b540efff2 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/home/zuxroy/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
