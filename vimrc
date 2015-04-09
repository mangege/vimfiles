set nocompatible

"vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'molokai'
Plugin 'mileszs/ack.vim' 
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'taglist.vim'
Plugin 'kien/ctrlp.vim'

Plugin 'tpope/vim-rails'
Plugin 'nvie/vim-flake8'
Plugin 'Rip-Rip/clang_complete'

" sytle
Plugin 'saltstack/salt-vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hallison/vim-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'

" JS
Plugin 'walm/jshint.vim'
Plugin 'maksimr/vim-jsbeautify'

" snipmate
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on
"end vundle

syntax on

set term=xterm-256color
let g:molokai_original = 1
colorscheme molokai

set history=1000
set mouse=v
set showcmd
set showmode
set number
set showbreak=...
set wrap linebreak nolist
set linespace=4
set visualbell t_vb=

set tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType ruby setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
au FileType yaml setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
au FileType python setlocal et sta sw=4 sts=4
au FileType javascript setlocal et sta sw=4 sts=4

set foldmethod=indent
set foldnestmax=3
set nofoldenable

set formatoptions-=o
set hidden
set wildmode=list:longest
set wildmenu

set hlsearch
set incsearch

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

"http://www.nonozone.net/solve-vim-chinese-garbled.html
set fileencodings=utf-8,gb2312,gbk,gb18030,default,latinl
set fileformats=unix,dos

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

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" HOTKEY

"http://vim.wikia.com/wiki/How_to_stop_auto_indenting
nnoremap <F8> :setl noai nocin nosi inde=<CR>

" toggle paste mode on/off
map <F9> :set paste!<cr>:set paste?<cr>

"open current to new tab
map <Leader>t :tabnew %<CR>

nnoremap <F12> :nohlsearch<CR> 

"key mapping for window navigation 映射窗口切换快捷键
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"key mapping for saving file 映射C-S快速保存文件
nmap <C-s> :w<CR>

" maksimr/vim-jsbeautify
autocmd FileType javascript noremap <buffer>  <Leader>f :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <Leader>f :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <Leader>f :call CSSBeautify()<cr>

" http://www.vim.org/scripts/script.php?script_id=3081
autocmd FileType javascript noremap <buffer> <Leader>j :JSHint<cr>
