## Summary

Used for synchronizing vim configurations across all devices.
Requires Vim 9.1+ (older versions work but skip the bundled packages).

## How to install

    git clone git@github.com:lty1308/myvim.git ~/.myvim
    sh ~/.myvim/install.sh

Optional but recommended: `brew install ripgrep` for fast `:grep`, `:Rg` and `:Files`.

## How to update

    cd ~/.myvim
    git pull --rebase
    vim +PlugUpdate +PlugClean! +qa

## Layout

- `vimrcs/basic.vim` - options and key maps (no plugins needed)
- `vimrcs/plugin.vim` - plugins (managed by [vim-plug](https://github.com/junegunn/vim-plug)) and their settings
- Plugins are installed into `plugged/` and are not checked in

## Language servers

Completion, go-to-definition, etc. come from [vim-lsp](https://github.com/prabirshrestha/vim-lsp).
Open a file and run `:LspInstallServer` to install the server for that language
(via [vim-lsp-settings](https://github.com/mattn/vim-lsp-settings)).

## Key maps

| Key | Action |
| --- | --- |
| `,` | Leader |
| `<Space>` | Search |
| `jk` | Escape (insert mode) |
| `H` / `L` | Start / end of line |
| `J` / `K` | Half page down / up |
| `<C-h/j/k/l>` | Move between windows |
| `ff` | Find files (fzf) |
| `,b` | Switch buffers (fzf) |
| `,/` | Search project (ripgrep + fzf) |
| `gr` | Grep word under cursor into quickfix |
| `]q` / `[q` | Next / previous quickfix match |
| `tt` | Toggle NERDTree |
| `,n` | Toggle relative line numbers |
| `gcc` / `gc{motion}` | Toggle comments |
| `gd` / `gR` | Go to definition / references (LSP) |
| `,h` | Hover docs (LSP) |
| `,rn` / `,ca` | Rename / code action (LSP) |
| `,tl` | Document symbols (LSP) |
| `[g` / `]g` | Previous / next diagnostic (LSP) |

## Acknowledgement

Inspired by [amix/vimrc](https://github.com/amix/vimrc/blob/master/)
