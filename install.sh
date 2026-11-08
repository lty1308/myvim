#!/bin/sh
set -e
cd ~/.myvim

# Back up an existing ~/.vimrc before replacing it
if [ -f ~/.vimrc ] && ! grep -qE 'myvim|vim_tyli' ~/.vimrc; then
    backup=~/.vimrc.bak.$(date +%Y%m%d%H%M%S)
    mv ~/.vimrc "$backup"
    echo "Backed up existing ~/.vimrc to $backup"
fi

cat > ~/.vimrc <<'VIMRC'
set runtimepath+=~/.myvim
source ~/.myvim/vimrcs/basic.vim
source ~/.myvim/vimrcs/plugin.vim
VIMRC

# Install vim-plug
curl -fsSLo ~/.myvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins
vim -es -u ~/.vimrc -i NONE -c 'PlugInstall --sync' -c 'qa' || true

if ! command -v rg >/dev/null 2>&1; then
    echo "Tip: install ripgrep (brew install ripgrep) for faster :grep, :Rg and :Files"
fi

echo "Installed successfully! Enjoy ^ ^"
