" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file finder.
Plug 'sheerun/vim-polyglot' " Better syntax and indentation.
Plug 'itchyny/lightline.vim' " update status line.
Plug 'jlanzarotta/bufexplorer' " Buffer explorer
Plug 'airblade/vim-gitgutter' " Shows git diffs in 'gutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim' " Provides a nice way to write html
Plug 'w0rp/ale' " Asyncrhonous linter for all linters
Plug 'RRethy/vim-illuminate' " Highlight words that match what's under the cursor throughout the file
Plug 'lilydjwg/colorizer' " Colorize hex color codes
Plug 'Yggdroot/indentLine' "Adds indentation lines
Plug 'ntk148v/vim-horizon' "Horizon vim theme
Plug 'mcmartelle/vim-monokai-bold' "Vim colour scheme
call plug#end() "Init all plugins

" plugin related variables/configs
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-emmet',
    \ 'coc-css',
    \ 'coc-json',
    \ 'coc-eslint',
    \ 'coc-clangd',
    \ 'coc-rls',
    \ 'coc-go',
    \ 'coc-python',
    \ 'coc-spell-checker',
    \ 'coc-yaml'
    \ ]
set cmdheight=1 " Set the cmd height
set updatetime=300 " Change the update time.

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and all it's references.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Rename symbols
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selection ranges.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

"
" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" enable rainbow plugin at startup
let g:rainbow_active=0
hi link illuminatedWord Visual

"Enable plugin indent
filetype plugin indent on
set laststatus=2 "Display the status line for vim. (Needed for lightline)
syntax on "Turn syntax highlighting on. (Needed for polyglot)
set nowrap "Don't wrap lines.
set backspace=indent,eol,start "Allow everything to be backspaced over in insert mode.
set autoindent "Auto indents, at least I think
set copyindent "Copy previous indentation of autoindent.
set number "set line numbers
set tabstop=4 shiftwidth=4 "Tabbing is always 4 spaces (hard tabs)
set expandtab "INsert tabs on the start of a line according to shiftwidth
set showmatch "Show matching parantheses.
set visualbell "Don't beep
set noerrorbells "Plz don't beep
set hidden "Allow edited hidden buffers that aren't visible to exist in the back
set backup "Tells vim where to save backup files
set backupdir=$HOME/.vim/backup/ "Where to save backup files
set noswapfile "Remove the swap file
set dir=$HOME/.vim/swap/ "Where to save swap files
set background=dark "Set the background dark
set t_Co=256 "Set the terminal to use 256 colors
set mouse=a "Set the mouse on
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim " sets up golang/linter

" Colour scheme
syntax on
set t_Co=256 
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

" Copy into clipboard
vnoremap <C-c> "+y
map <C-v> "+P

"Go to normal mode and quit once in it
inoremap <silent> jj <ESC>
nnoremap <silent> ;; :q<CR>

"Buffers - explore/next/previous (Bufexplorer plugin)
nnoremap <silent> 00 :BufExplorer<CR>
nnoremap <silent> 99 :bn<CR>
nnoremap <silent> 88 :bp<CR>

"Key mapping for saving via ctrl-s in all modes
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
