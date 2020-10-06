" init.vim

let mapleader=','

" Vundle
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sleuth'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'chriskempson/base16-vim'

Plugin 'w0rp/ale'
let g:ale_sign_column_always = 1

Plugin 'Raimondi/delimitMate'
let g:delimitMate_expand_cr=1

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts=1
let g:airline_theme='minimalist'

Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plugin 'lervag/vimtex'
let g:tex_flavor='latex'

call vundle#end()
filetype on
filetype plugin indent on



set ruler
set cursorline
set number
set smartindent
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

colorscheme base16-default-dark
set termguicolors
set background=dark

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" navigate splits
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

