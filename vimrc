"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"git interface
Plugin 'tpope/vim-fugitive'

"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'

"html
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'
"python sytax checker
Plugin 'nvie/vim-flake8'
"Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

"auto-completion stuff
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/rope-vim'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'spiroid/vim-ultisnip-scala'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'honza/vim-snippets'

"SPARQL
Plugin 'Omer/vim-sparql'

"R
Plugin 'vim-scripts/Vim-R-plugin'

"Scala
Plugin 'derekwyatt/vim-scala'

"Ruby
Plugin 'vim-ruby/vim-ruby'

"Docker
Plugin 'ekalinin/Dockerfile.vim'

"YAML
Plugin 'stephpy/vim-yaml'

""code folding
Plugin 'tmhedberg/SimpylFold'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'marcopaganini/termschool-vim-theme'

"Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

set t_Co=256

filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1
"let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

let g:ycm_dont_warn_on_startup = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

let g:ycm_filetype_blacklist = {}

let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

"--------------------------------------------------
" Supertab - enhanced tab behavior based on context
"--------------------------------------------------

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

"----------------------------------------
" UltiSnips - Fancy snippet functionality
"----------------------------------------

let g:UltiSnipsSnippetsDir='~/.vim/bundle/vim-snippets/snippets'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

nnoremap <leader>ue :UltiSnipsEdit<cr>

"custom keys
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
call togglebg#map("<F5>")
"colorscheme zenburn
colorscheme termschool
"set guifont=Monaco:h14


" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'
set laststatus=2
let g:airline_powerline_fonts = 1

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"I don't like swap files
set noswapfile

"turn on numbering
set nu


" generic tabs
set ts=4

"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"spaces for indents
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set Nextflow file to be highlighted as Groovy
autocmd BufNewFile,BufRead *.nf set syntax=groovy


" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2


" Re-open file from last line
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
