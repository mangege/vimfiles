#!/usr/bin/env bash
ln -s `pwd` ~/.vim
ln -s `pwd`/vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall #install vim plugin
