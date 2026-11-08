#!/bin/sh
set -e
cd ~/.vim_tyli

# Install vim-plug
curl -fLo ~/.vim_tyli/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo '
    set runtimepath+=~/.vim_tyli
    source ~/.vim_tyli/vimrcs/basic.vim
    source ~/.vim_tyli/vimrcs/plugin.vim
' > ~/.vimrc

# Install plugins
vim -es -u ~/.vimrc -i NONE -c 'PlugInstall --sync' -c 'qa' || true

echo "Installed successfully! Enjoy ^ ^"
