""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration
""""""""""""""""""""""""""""""""""""""""""

""""""""""""
" Bundled packages (ship with Vim 9.1; silent! for older Vims)
""""""""""""
silent! packadd! comment       " gc{motion} / gcc to toggle comments
silent! packadd! editorconfig  " Respect .editorconfig files
silent! packadd! hlyank        " Briefly highlight yanked text
silent! packadd! nohlsearch    " Clear search highlight after moving on
silent! packadd! matchit       " Extended % matching (if/else, tags)

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
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" LSP + completion (:LspInstallServer in a buffer to install its server)
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Colorscheme
Plug 'joshdick/onedark.vim'

" Languages
Plug 'pangloss/vim-javascript'
Plug 'udalov/kotlin-vim'
Plug 'rust-lang/rust.vim'

call plug#end()

""""""""""""
" Colorscheme
""""""""""""
" Falls back to the built-in habamax before plugins are installed
try
    colorscheme onedark
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme habamax
endtry

""""""""""""
" NERDTree
""""""""""""
nnoremap tt :NERDTreeToggle<CR>

""""""""""""
" fzf
""""""""""""
nnoremap ff :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>/ :Rg<CR>
" List files with ripgrep so :Files respects .gitignore
if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git"'
endif

""""""""""""
" LSP
""""""""""""
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd         <plug>(lsp-definition)
    nmap <buffer> gR         <plug>(lsp-references)
    nmap <buffer> <leader>h  <plug>(lsp-hover)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> <leader>ca <plug>(lsp-code-action)
    nmap <buffer> <leader>tl <plug>(lsp-document-symbol-search)
    nmap <buffer> [g         <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g         <plug>(lsp-next-diagnostic)
endfunction

augroup tyli_lsp
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

""""""""""""
" Completion
""""""""""""
" <Tab> cycles the popup menu; otherwise falls back to keyword completion
" after a word character (what supertab used to do)
function! s:tab_complete() abort
    if pumvisible() | return "\<C-n>" | endif
    let l:col = col('.') - 1
    return (l:col == 0 || getline('.')[l:col - 1] =~# '\s') ? "\<Tab>" : "\<C-n>"
endfunction
inoremap <expr> <Tab>   <SID>tab_complete()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

""""""""""""
" JavaScript
""""""""""""
let g:javascript_plugin_jsdoc = 1
