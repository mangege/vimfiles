set nocompatible

"vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vimcn/vimcdoc'
Plugin 'mileszs/ack.vim' 
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'taglist.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'sickill/vim-monokai'
Plugin 'altercation/vim-colors-solarized'

Plugin 'nvie/vim-flake8'
Plugin 'hynek/vim-python-pep8-indent'

Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

" sytle
Plugin 'hallison/vim-markdown'

" snipmate
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'tpope/vim-surround'

Plugin 'posva/vim-vue'
Plugin 'digitaltoad/vim-pug'

Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on
"end vundle

syntax on

" set term=xterm-256color
let g:solarized_termcolors=256
set background=light
colorscheme solarized

set history=1000
set mouse=v
set showcmd
set showmode
set number
set wrap linebreak nolist
set linespace=4
set visualbell t_vb=

set tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType ruby setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
autocmd FileType eruby setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType javascript setlocal et sta sw=4 sts=4
autocmd FileType vue setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4

autocmd FileType go setlocal shiftwidth=8 tabstop=8 softtabstop=8 noexpandtab

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
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp\|bundle\|stickers\|system\|contents\|datas',
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

"key mapping for saving file 映射C-S快速保存文件
nmap <C-s> :w<CR>

autocmd FileType crontab setlocal nobackup nowritebackup

autocmd BufNewFile,BufRead *.rabl setfiletype ruby
autocmd BufNewFile,BufRead *.jbuilder setfiletype ruby
autocmd BufNewFile,BufRead *.j2 setfiletype jinja
autocmd BufNewFile,BufRead *.es6 setfiletype javascript
" 已经被检测到文件类型了,必须加 if 才会生效 http://vimcdoc.sourceforge.net/doc/syntax.html#ft-aspvbs-syntax
autocmd BufNewFile,BufRead *.raml if &ft == 'conf' | set ft=yaml | endif
autocmd BufNewFile,BufRead *.amp.erb if &ft == 'eruby' | set ft=eruby.html | endif

" http://stackoverflow.com/questions/6009698/autocmd-check-filename-in-vim
"autocmd FileType ruby if filereadable("config/application.rb") | UltiSnipsAddFiletypes rails.ruby
autocmd FileType yaml if filereadable("config/application.rb") | UltiSnipsAddFiletypes yaml.eruby

autocmd FileType vue UltiSnipsAddFiletypes html.javascript.css
