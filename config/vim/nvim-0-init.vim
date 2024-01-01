set nocompatible
autocmd!
set history=500
set showmode
set wildmode=list:longest,full
set showcmd
set showmatch
set autowrite
set completeopt=menuone
set scrolloff=6
set backspace=indent,eol,start
set ruler
set nu
set nomodeline
set nowrap
set textwidth=0
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set autoindent
set expandtab
set incsearch
set hidden
set noswapfile
set nomousehide
set encoding=utf-8
set termencoding=utf-8
filetype on
filetype indent on
filetype plugin on
syntax on
noremap <F4> <ESC>:set paste!<CR>
noremap <silent> <F11> <ESC>:bprev<CR>
noremap <silent> <F12> <ESC>:bnext<CR>
colorscheme habamax
