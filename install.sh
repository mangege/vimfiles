#!/usr/bin/env bash
ln -s `pwd` ~/.vim
ln -s `pwd`/vimrc ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
