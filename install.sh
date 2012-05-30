#!/usr/bin/env bash
ln -s `pwd` ~/.vim
ln -s `pwd`/vimrc ~/.vimrc
git submodule init
git submodule update
vim +BundleInstall +qall #install vim plugin
