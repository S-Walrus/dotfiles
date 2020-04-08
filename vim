set ruler
set cursorline
set number
set smartindent
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

let mapleader=','

set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'

Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'evanrelf/vim-pico8-color'
Plugin 'ssteinbach/vim-pico8-syntax'
Plugin 'andreypopp/vim-colors-plain'
Plugin 'tpope/vim-sleuth'
Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()
filetype plugin indent on



colorscheme plain
set termguicolors
set background=dark

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

let g:airline_powerline_fonts=1
let g:airline_theme='minimalist'
let g:delimitMate_expand_cr=1
map <leader>t :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:ale_sign_column_always = 1

autocmd FileType pico8 colorscheme pico8
