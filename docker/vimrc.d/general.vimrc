" --------------------------------
" Pretty things
" --------------------------------
syntax on

"rainbow Plugin Options (luochen1990/rainbow)
let g:rainbow_active = 0    " 0 if you want to enable it later via :RainbowToggle



" --------------------------------
" Basic stuff
" --------------------------------
let g:mapleader = " " " Set leader to spacebar
set backspace=indent,eol,start " Bring backspace to life
set hlsearch        " Highlight whole word when searching
set ignorecase      " Ignore case when searching...
set smartcase       " ...except when search query contains a capital letter
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
nnoremap 0 :res -2<CR> " decrease pane by 2
nnoremap 8 :vertical res +2<CR> " vertical increase pane by 2
nnoremap 9 :vertical res -2<CR> " vertical decrease pane by 2

" Change split
nnoremap 1 <C-w>h
nnoremap 2 <C-w>l

vnoremap 1 <C-w>h
vnoremap 2 <C-w>l

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

" Insert Timestamp
command! Date pu=strftime('%c')


cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'close' : 'q')<CR>

" New Tabs
nnoremap T :tabnew<cr>
nnoremap U :tabnew#<cr>

" Remap Save
nnoremap <leader>s :w<CR>

" Remove ~
set fcs=eob:\ 

tnoremap <Esc><Esc> <C-\><C-n>
	augroup insertonenter
		function! InsertOnTerminal()
			if &buftype ==# "terminal"
				normal i
			endif
		endfunction

		autocmd! BufEnter * call InsertOnTerminal()
		if has('nvim')
			autocmd! TermOpen * call InsertOnTerminal()
		endif
	augroup END

hi VertSplit ctermfg=0 ctermbg=NONE cterm=NONE
highlight clear SignColumn

