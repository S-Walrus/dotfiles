"####################### PLUGINS #######################"

" Vundle
" Installation:
"   git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
"   :PluginInstall
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
" Base
Plugin 'VundleVim/Vundle.vim'

" Smart indentation for Python
Plugin 'Vimjas/vim-python-pep8-indent'

" Color scheme
Plugin 'chriskempson/base16-vim'

" Linter
Plugin 'w0rp/ale'
    let g:ale_sign_column_always = 1

" Closes brackets for me
Plugin 'Raimondi/delimitMate'
    let g:delimitMate_expand_cr=1

" Beautiful status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
    let g:airline_powerline_fonts=1
    let g:airline_theme='minimalist'

" LaTeX support
Plugin 'lervag/vimtex'
    let g:tex_flavor='latex'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

" Language server with a bunch of IDE-like features
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
"   Extensions:
"       coc-python
"       coc-texlab
"       coc-snippets
"   Example: :CocInstall coc-python

call vundle#end()



"####################### VANILLA #######################"

let mapleader=',' 

" Files
filetype on
filetype plugin indent on

" Editor
set ruler
set cursorline
set number relativenumber   "relative numbers
" 4 spaces per tab
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=1

" Colors
colorscheme base16-default-dark
set termguicolors
set background=dark

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" Keymap
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Navigate splits
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>



"######################### CoC #########################"

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300  "controversial (default: 4000)
set shortmess+=c

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" use `[g` and `]g` to navigate diagnostics
" use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" goto code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" use CTRL-S for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" mappings for CoCList
" show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

