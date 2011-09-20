set nocompatible
call pathogen#infect() "pathogen
syntax on
filetype plugin indent on

if $COLORTERM == 'gnome-terminal' 
  set term=gnome-256color 
  let g:molokai_original = 1
  colorscheme molokai 
else 
  colorscheme elflord 
endif 

"store lots of :cmdline history 保存命令历史
set history=1000

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
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

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
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

"ragtag 快速输入eruby 标签
let g:ragtag_global_maps = 1 

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
source ~/.vim/snippets/support_functions.vim
autocmd vimenter * call s:SetupSnippets()
function! s:SetupSnippets()
    call ExtractSnips("~/.vim/snippets/html", "eruby")
    call ExtractSnips("~/.vim/snippets/html", "xhtml")
endfunction