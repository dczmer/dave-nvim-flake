" Base settings
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
set updatetime=300
set signcolumn=yes
filetype on
filetype indent on
filetype plugin on
syntax on

" Base keybinds
noremap <F4> <ESC>:set paste!<CR>
noremap <silent> <F11> <ESC>:bprev<CR>
noremap <silent> <F12> <ESC>:bnext<CR>
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
cmap w!! w !sudo tee > /dev/null %

let mapleader = ","
let maplocalleader = "\\"

" Visual
colorscheme habamax
" Airline config
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
let g:airline_section_c = '%t'
let g:airline#extensions#default#section_truncate_width = { 'c': 40 }

" Sometimes highlighting matching bracket is confusing in terminals
hi MatchParen ctermbg=blue ctermfg=white

" mi no speel gud
set spell

" toggle background transparency for contrast
" NOTE: this is specific to the minimalist theme colors i'm using.
let g:dave_transparent_bg = 0
function! Toggle_transparent_bg()
    if g:dave_transparent_bg > 0
        hi Normal ctermfg=188 ctermbg=234 guifg=#e8e8d3 guibg=#151515
        let g:dave_transparent_bg = 0
    else
        hi Normal ctermfg=188 ctermbg=NONE guifg=#e8e8d3 guibg=#151515
        let g:dave_transparent_bg = 1
    endif
endfunction
map <silent> <leader>bg :call Toggle_transparent_bg()<CR>

" look for ~/.hacks.vim for extra/temp stuff to apply on load
if !empty(expand(glob("~/.hacks.vim")))
    source ~/.hacks.vim
endif
