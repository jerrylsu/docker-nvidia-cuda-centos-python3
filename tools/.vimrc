" <operation> <motion> 操作 动作
let mapleader=" "
syntax on
set number
set relativenumber
set cursorline
set wrap                    " 超越窗口，换行显式
set showcmd
set wildmenu

" 搜索相关
set hlsearch                " 搜索高亮 # 命令exec:执行冒号后的指令，新打开的文件去除之前搜索的留下的高亮
exec "nohlsearch"
set incsearch               " 搜索，边搜边高亮
set ignorecase
set smartcase
" n搜索下翻，zz居中显式
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>



set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse-=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap i k
noremap k j
noremap j h
noremap l l

noremap I 10k
noremap K 10j
noremap J 5h
noremap L 5l

noremap e i

" N key: go to the start of the line
noremap <C-n> 0
" I key: go to the end of the line
noremap <C-i> $

map s <nop>     " 失效 no operation
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map ; :

map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>
map sj :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>

map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>j <C-w>h
map <LEADER>l <C-w>l

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map tu :tabe<CR>
map tn :-tabnext<CR>
map ti :+tabnext<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

