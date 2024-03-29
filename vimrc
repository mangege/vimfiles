set nocompatible

"vundle
filetype off
call plug#begin()

Plug 'mileszs/ack.vim' 
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'altercation/vim-colors-solarized'

Plug 'nvie/vim-flake8'
Plug 'hynek/vim-python-pep8-indent'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" snipmate
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-surround'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'tomlion/vim-solidity'

Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

call plug#end()
filetype plugin indent on
"end vundle

syntax on

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

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

set tabstop=4 expandtab shiftwidth=2 softtabstop=2
autocmd FileType ruby setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
autocmd FileType markdown setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
autocmd FileType python setlocal et sta sw=4 sts=4
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
" 已经被检测到文件类型了,必须加 if 才会生效 http://vimcdoc.sourceforge.net/doc/syntax.html#ft-aspvbs-syntax
autocmd BufNewFile,BufRead *.raml if &ft == 'conf' | set ft=yaml | endif
autocmd BufNewFile,BufRead *.amp.erb if &ft == 'eruby' | set ft=eruby.html | endif

" http://stackoverflow.com/questions/6009698/autocmd-check-filename-in-vim
"autocmd FileType ruby if filereadable("config/application.rb") | UltiSnipsAddFiletypes rails.ruby
autocmd FileType yaml if filereadable("config/application.rb") | UltiSnipsAddFiletypes yaml.eruby
