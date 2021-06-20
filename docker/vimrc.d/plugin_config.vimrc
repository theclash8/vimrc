" Nerd tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize=30
"let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeMouseMode = 1
let NERDTreeShowBookmarks=1
let g:NERDTreeMapOpenInTabSilent = '<2-LeftMouse>'
let NERDTreeChDirMode=2

" map <C-e> :NERDTreeToggle<CR>
map º :NERDTreeToggle<CR>

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
set updatetime=100

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" Nvim-tree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" lightline
set laststatus=2

" Note
let g:notes_directories = ['~/jaleb/vim-notes/']

" Docker.vim
command! Docker DockerToolsToggle 
let g:docker_plugin_version_check = 1
let g:docker_terminal_open = 'bo'
let g:docker_open_browser_cmd = 'open'

" enable AutoSave on Vim start-up
let g:auto_save = 1 

" Spelling text
if has("spell")
    " turn spelling on by default
    " set spell
    set spelllang=en_gb,es,cjk
    nnoremap <leader>sss :set spell!<cr>
    " they were using white on white
    highlight PmenuSel ctermfg=black ctermbg=lightgray
    " limit it to just the top 10 items
    set sps=best,10                    
endif

if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif

"Tabman
let g:tabman_toggle = '<C-k>'
let g:tabman_side = 'left'
let g:tabman_number = 0
let g:tabman_specials = 1

"VExplore
"map <C-e> :Lexplore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 0
let g:netrw_winsize = 17

nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

au TermOpen * setlocal nonumber norelativenumber

highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

tnoremap <Esc><Esc> <C-\><C-n>
autocmd BufWinEnter,WinEnter term://* startinsert

nnoremap <silent> ,t :split<CR>:terminal<CR>
nnoremap <silent> td :vsplit<CR>:terminal<CR>

"VimWiki
au BufNewFile /home/lrossi/jaleb/wiki/diary/*.wiki :silent 0r !~/jaleb/scripts/generate-vimwiki-diary-template '%'

let g:vimwiki_list = [{
    \ 'path': '$HOME/jaleb/wiki',
    \ 'template_path': '$HOME/jaleb/wiki/templates',
	\ 'template_default': 'def_template',
	\ 'template_ext': '.html',}]

" add the pre tag for inserting code snippets
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr, pre, script'

command! Diary VimwikiDiaryIndex
command! Wiki VimwikiIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end
"au BufNewFile ~/jaleb/wiki/diary/*.wiki :silent 0r !~/jaleb/generate-vimwiki-diary-template
command! Template :silent 0r !~/jaleb/generate-vimwiki-diary-template


"Indent
nnoremap <leader>ii <cmd>IndentGuidesToggle<cr>
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=230 ctermbg=2
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=235 ctermbg=1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

"Tmux Integration
"let g:tmux_navigator_no_mappings = 1
"nnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
"nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
"nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
"nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

"Bookmarks
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=233 ctermfg=NONE
highlight BookmarkAnnotationLine ctermbg=235 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 0
nmap <Leader><Leader> <Plug>BookmarkToggle
nmap <Leader>i <Plug>BookmarkAnnotate
nmap <Leader>a <Plug>BookmarkShowAll
nmap <Leader>j <Plug>BookmarkNext
nmap <Leader>k <Plug>BookmarkPrev
nmap <Leader>c <Plug>BookmarkClear
nmap <Leader>x <Plug>BookmarkClearAll

"Nerd Commenter
nmap ++ <plug>NERDCommenterToggle
vmap ++ <plug>NERDCommenterToggle

"Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
