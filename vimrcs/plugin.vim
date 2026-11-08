""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration
""""""""""""""""""""""""""""""""""""""""""

""""""""""""
" vim-plug
""""""""""""
" Run :PlugInstall to install, :PlugUpdate to update, :PlugClean to remove
call plug#begin('~/.vim_tyli/plugged')

" Navigation
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Editing
Plug 'ervandew/supertab'
Plug 'cohama/lexima.vim'

" Languages
Plug 'pangloss/vim-javascript'
Plug 'udalov/kotlin-vim'
Plug 'rust-lang/rust.vim'

call plug#end()

""""""""""""
" NERDTree
""""""""""""
nnoremap tt :NERDTreeToggle<CR>

""""""""""""
" fzf
""""""""""""
nnoremap ff :Files<CR>
nnoremap <leader>b :Buffers<CR>

""""""""""""
" Supertab
""""""""""""
let g:SuperTabDefaultCompletionType = "context"

""""""""""""
" JavaScript
""""""""""""
let g:javascript_plugin_jsdoc = 1
