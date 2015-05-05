关于
===
一个ruby程序员的vim配置文件.  
linux平台可以正常使用.

安装
===
1. 打开终端, 执行 `git clone git://github.com/mangege/vimfiles.git`
2. `cd vimfiles`,执行 `bash install.sh` (执行过程中会调用vim,因插件还没有完全安装,会报错,不用管,按回车就行.之后就等vundle从github自动安装插件,安装成功后会自动退出vim,完成)
3. ubuntu执行`sudo apt-get install ack-grep`, arch执行`sudo pacman -Sy ack`
4. 安装Ctags
5. sudo npm install -g jshint
6. sudo pip install flake8
