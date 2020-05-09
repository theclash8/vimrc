set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'git://github.com/xolox/vim-notes.git'
Plugin 'git://github.com/xolox/vim-misc.git'
Plugin 'git://github.com/tpope/vim-markdown.git'
Plugin 'preservim/nerdtree'
Plugin 'git://github.com/airblade/vim-gitgutter.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'itchyny/lightline.vim'
Plugin 'git://github.com/terryma/vim-multiple-cursors.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-eunuch'
Plugin 'dense-analysis/ale.git'
Plugin 'kevinhui/vim-docker-tools'
Plugin '907th/vim-auto-save.git'

" All of your Plugins must be added before the following line
call vundle#end()


" --------------------------------
" Pretty things
" --------------------------------
syntax on

" Set Airline bar theme
let g:airline_theme='bubblegum'

"rainbow Plugin Options (luochen1990/rainbow)
let g:rainbow_active = 0    " 0 if you want to enable it later via :RainbowToggle

" Note
let g:notes_directories = ['~/Documents/Notes']

" --------------------------------
" Basic stuff
" --------------------------------
let g:mapleader = " " " Set leader to spacebar
set backspace=indent,eol,start " Bring backspace to life
set hlsearch        " Highlight whole word when searching
set ignorecase      " Ignore case when searching...
set smartcase       " ...except when serach query contains a capital letter
set autoread        " Auto load files if they change on disc
set number
colorscheme desert
map <Leader>p :set paste<CR><esc>"*]p:set nopaste<cr>
map <Leader>y "*y  )
map <Leader><Leader> :w<CR>
inoremap jj <ESC>:w<CR>

" Pasting - indent last pasted
nnoremap gz '[=']

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><ESC> :noh<cr>

"Cursor
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Open current file in a new vertical split with '='
" nnoremap = :vsplit<cr>

" Easy split resize
nnoremap 7 :res +2<CR> " increase pane by 2 
nnoremap 8 :res -2<CR> " decrease pane by 2
nnoremap 9 :vertical res +2<CR> " vertical increase pane by 2
noremap 0 :vertical res -2<CR> " vertical decrease pane by 2

" Simplify using tabs
nnoremap ˙ gT
nnoremap ¬ gt
nnoremap T :tabnew<cr>

" Open new splits to right and bottom
set splitbelow
set splitright

" Tab size
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Disable swap files
set noswapfile

" Nerd tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeWinPos = "right"
map <C-e> :NERDTreeToggle<CR>

" gitgutter
set updatetime=100

" lightline
set laststatus=2

" Docker.vim
let g:docker_plugin_version_check = 1
let g:docker_terminal_open = 'bo'
let g:docker_open_browser_cmd = 'open'

" enable AutoSave on Vim start-up
let g:auto_save = 1 

" Spelling text
if has("spell")
  " turn spelling on by default
  " set spell
  set spelllang=en_gb,it,es

  " toggle spelling with F4 key
  map <F4> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

  " they were using white on white
  highlight PmenuSel ctermfg=black ctermbg=lightgray

  " limit it to just the top 10 items
  set sps=best,10                    
endif
