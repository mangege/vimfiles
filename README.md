# Description
  个人的针对rails vimrc,只安装了必要的插件

# Installation
git clone git://github.com/mangege/myvimrc.git ~/.vim  
echo "source ~/.vim/vimrc" > ~/.vimrc  
git submodule init 
git submodule update  
rm -rf ~/.vim/bundle/snipmate.vim/snippets
cd ~/.vim/bundle/snipmate.vim
git commit -a -m 'rm default snippets'
