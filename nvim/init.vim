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
    let g:airline_theme='base16'

" LaTeX support
Plugin 'lervag/vimtex'
    let g:vimtex_view_general_viewer = 'mupdf'
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

" Highlight characters searhed for with f
Plugin 'rhysd/clever-f.vim'

call vundle#end()



"####################### VANILLA #######################"

let mapleader=',' 

" Mouse support
" set mouse=a

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
set termguicolors
colorscheme base16-material-darker
set background=dark

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" Navigate splits
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>



"######################### CoC #########################"

" Required by CoC
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

" TAB triggers completion with characters ahead and navigates
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" <CR> (aka. Enter or C-M) applies the first suggestion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Diagnostics
"   [ g  :  previous diaGnostics
"   ] g  :  next diaGnostics
" use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Goto commands
"   g d  :  Definition
"   g y  :  tYpe definition
"   g i  :  Implementation
"   g r  :  References
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Documentation
"   K  :  show documentaion in a preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Holding the cursor should highlight the symbol and show references
autocmd CursorHold * silent call CocActionAsync('highlight')

" Refactoring
"   r n    :  ReName symbol
"   <L> f  :  Format selected code
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"   <L> a  : Apply code action to selected code (doesn't work)
"   a c    : Apply code action to Current bufer
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)

"   <L> q f  : Quck Fix current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Selection
"   i f  : Inside Function
"   a f  : All Function
"   i c  : Inside Class
"   a c  : All Class
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Next selection range (whatever it means)
" use CTRL-S for selections ranges.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

"   :Format  -> Format current buffer
command! -nargs=0 Format :call CocAction('format')

"   :Fold    -> Fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"   :OR      -> Organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Lists
"   SPC a  : show All diagnostics
"   SPC e  : Extensions
"   SPC c  : Commands
"   SPC o  : dOcument symbols
"   SPC s  : workspace Symbols
"   SPC j  : default action for NEXT item
"   SPC k  : default action for PREVIOUS item
"   SPC p  : Previous list
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Snippets
" C-l  : expand
" C-h  : select text for snippet
" C-j  : jump to next placeholder
" C-k  : jump to previous placeholder
" C-h  : both expand and jump (disabled)
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-h> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
"imap <C-h> <Plug>(coc-snippets-expand-jump)
