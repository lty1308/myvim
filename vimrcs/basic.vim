" Maintainer:
"   Tianyu Li
"
" First Created:
"   12/20/2013
"
" Last Updated:
"   11/07/2026
"
""""""""""""""""""""""""""""""""""""""""""""


"""""""""""
" General
"""""""""""
" Start from Vim's own defaults (they are skipped once a ~/.vimrc exists):
" backspace, incsearch, showcmd, ttimeout, restore cursor position, etc.
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

set history=1000    " How many commands of history VIM has to remember
set autoread        " Set to auto read when a file is changed from outside
set updatetime=300  " Faster CursorHold (git signs, LSP diagnostics)
if has('clipboard')
    set clipboard=unnamed   " Yank/paste via the system clipboard
endif

filetype plugin indent on
syntax on

"""""""""""
" UI
"""""""""""
" Color & Fonts
set background=dark " Background color
if has('termguicolors') && $COLORTERM =~# '\v(truecolor|24bit)'
    set termguicolors   " 24-bit color when the terminal supports it
endif

" Main window
set scrolloff=7     " Keep 7 lines around the cursor
set ruler           " Always show current position
set ignorecase      " Ignore case when searching
set smartcase       " Be smart about cases when searching
set hlsearch        " Highlight search results
set incsearch       " Search as you type
set showmatch       " Show matching brackets
set expandtab       " Use spaces instead of tabs
set smarttab        " Smart tab usage
set shiftwidth=4    " 1 tab equals 4 spaces
set tabstop=4
set autoindent      " Auto indent (filetype indent plugins do the rest)
set wrap            " Wrap lines
set number          " Set line number
set signcolumn=yes  " Always show the sign column (git, LSP) to avoid jitter
set wildmenu        " Command-line completion menu
set wildoptions=pum " ...shown as a popup
set mouse=a         " Enable the mouse in all modes
set laststatus=2    " Always show the status line
set statusline=\ %F%m%r%h\ %w\ %r%{getcwd()}%h\ \ \ Line:\ %l,%P  " Format the status line
set cursorline      " Highlight the current line

" File
set encoding=utf-8      " Default encoding is UTF-8
set fileformats=unix,dos " Prefer Unix, but read DOS files without ^M
set nobackup            " No back up
set noswapfile          " No swap file

" Persistent undo (makes up for having no swap/backup files)
if has('persistent_undo')
    let s:undodir = expand('~/.vim/undo')
    if !isdirectory(s:undodir)
        call mkdir(s:undodir, 'p', 0700)
    endif
    let &undodir = s:undodir . '//'
    set undofile
endif

" Filetype-specific settings
augroup tyli_filetypes
    autocmd!
    autocmd FileType gitcommit setlocal textwidth=72
augroup END

"""""""""""
" Key maps
"""""""""""
" Map <leader> to ,
let mapleader = ","

" Map <Space> to search
nnoremap <space> /

" Move between window
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Toggle relative line numbers
nnoremap <leader>n :set relativenumber!<CR>

" Map jk to <esc>
inoremap jk <esc>

" Super left/right
noremap <S-h> ^
noremap <S-l> $

" Page up/down
noremap <S-k> <C-u>
noremap <S-j> <C-d>

" Grep

" Prefer ripgrep, fall back to grep
if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case
    set grepformat=%f:%l:%c:%m
else
    set grepprg=grep\ -rnI\ --exclude-dir=.git\ $*\ .
endif

" Next/previous quickfix match (frees up C and P)
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" Grep the current word and list matches in the quickfix window
nnoremap <silent> gr :silent grep! -w <cword><CR>:copen<CR>:redraw!<CR>
