""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration
""""""""""""""""""""""""""""""""""""""""""

""""""""""""
" vim-plug
""""""""""""
" Run :PlugInstall to install, :PlugUpdate to update, :PlugClean to remove
call plug#begin('~/.vim_tyli/plugged')

Plug 'preservim/nerdtree'
Plug 'ervandew/supertab'
Plug 'vim-scripts/taglist.vim'
Plug 'wincent/command-t'
Plug 'Raimondi/delimitMate'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'groenewege/vim-less'
Plug 'udalov/kotlin-vim'
Plug 'rust-lang/rust.vim'

call plug#end()

""""""""""""
" Nerd Tree
""""""""""""
nnoremap tt :NERDTreeToggle<cr>

""""""""""""
" Supertab
""""""""""""
let g:SuperTabDefaultCompletionType = "context"

""""""""""""
" Taglist
""""""""""""
map <leader>tl :TlistToggle<CR>

""""""""""""
" CommandT
""""""""""""
nmap ff :CommandT .<CR>

""""""""""""
" CommandT
""""""""""""
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
