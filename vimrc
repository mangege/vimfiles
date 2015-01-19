set nocompatible

"vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'mileszs/ack.vim' 
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-rails'
Bundle 'mangege/snipmate.vim'
Bundle 'mangege/snipmate-snippets'
Bundle 'scrooloose/syntastic'
Bundle 'gnupg.vim'
Bundle 'hallison/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'groenewege/vim-less'
Bundle 'molokai'
Bundle 'vimwiki'
Bundle 'taglist.vim'
Bundle 'nvie/vim-flake8'
Bundle 'Rip-Rip/clang_complete'
"JSHint {file}
Bundle 'walm/jshint.vim'
Bundle 'mangege/web-indent'
Bundle 'pythoncomplete'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'yaymukund/vim-rabl'
Bundle 'kien/ctrlp.vim'

"http://www.vim.org/scripts/script.php?script_id=3081
map <Leader>jh :JSHint <cr>

"http://vim.wikia.com/wiki/How_to_stop_auto_indenting
nnoremap <F8> :setl noai nocin nosi inde=<CR>

filetype plugin indent on
"end vundle

syntax on

set term=xterm-256color
let g:molokai_original = 1
colorscheme molokai

"store lots of :cmdline history 保存命令历史
set history=1000

set mouse=v

set showcmd "show incomplete cmds down the bottom 显示正在输入的命令
set showmode "show current mode down the bottom 显示当前模式

set number      "add line numbers 显示行号
set showbreak=... "自动换行显示...
set wrap linebreak nolist

"add some line space for easy reading 行与行之间的距离
set linespace=4

"disable visual bell 禁用蜂鸣
set visualbell t_vb=

"indent settings 缩进
set tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType ruby setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
au FileType yaml setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
au FileType python setlocal et sta sw=4 sts=4
au FileType javascript setlocal et sta sw=4 sts=4

"folding settings 折叠
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set formatoptions-=o "dont continue comments when pushing o/O 自动注释

"hide buffers when not displayed
"文件不在vim显示时隐藏到缓存区,关闭时会把文件从缓冲区删除
set hidden

"命令模式补全时显示所有匹配
set wildmode=list:longest
set wildmenu

" toggle paste mode on/off
map <F9> :set paste!<cr>:set paste?<cr>

"open current to new tab
map <Leader>t :tabnew %<CR>

"高亮搜索
set hlsearch
set incsearch
nnoremap <F12> :nohlsearch<CR> 

"key mapping for window navigation 映射窗口切换快捷键
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"key mapping for saving file 映射C-S快速保存文件
nmap <C-s> :w<CR>

"key mapping for tab navigation 快捷TAB导航
"nmap <Tab> gt
"nmap <S-Tab> gT

"Ack 搜索插件设置
if executable("ack")
    let g:ackprg="ack -H --nocolor --nogroup --column"
else
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif

"ctag
if executable("/usr/local/bin/ctags")
    let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
endif

"ragtag 快速输入eruby 标签
let g:ragtag_global_maps = 1 

"statusline setup  状态栏显示文件完整路径
set statusline=%f       "tail of the filename

"语法检查
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"mark syntax errors with :signs
let g:syntastic_enable_signs=1

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
"记录文件上次打开时光标所在位置
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"snipmate setup 安装片断
let snippets_dir = '~/.vim/bundle/snipmate-snippets' "忽略自带的snippets
source ~/.vim/bundle/snipmate-snippets/support_functions.vim
autocmd vimenter * call s:SetupSnippets()
function! s:SetupSnippets()
    call ExtractSnips("~/.vim/bundle/snipmate-snippets/html", "eruby")
endfunction

"off paredit
let g:paredit_mode = 0

"Highlight long lines http://vim.wikia.com/wiki/VimTip810
"au BufWinEnter *.rb let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
"au BufWinEnter *.rb let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

"http://www.nonozone.net/solve-vim-chinese-garbled.html
set fileencodings=utf-8,gb2312,gbk,gb18030,default,latinl
"set termencoding=utf-8
set fileformats=unix,dos
"set encoding=prc

"taglist.vim
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1

let NERDTreeIgnore = ['\.pyc$']

"ctrlp.vim
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|pyenv)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': '',
  \ }
