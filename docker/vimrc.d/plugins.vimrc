" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'git://github.com/xolox/vim-misc.git'
Plugin 'git://github.com/tpope/vim-markdown.git'
Plugin 'preservim/nerdtree'
Plugin 'git://github.com/airblade/vim-gitgutter.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-eunuch'
Plugin 'dense-analysis/ale.git'
Plugin 'kevinhui/vim-docker-tools'
Plugin '907th/vim-auto-save.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'wilon/vim-auto-session'
Plugin 'kien/tabman.vim.git'
Plugin 'gcmt/taboo.vim'
Plugin 'https://github.com/elzr/vim-json'
Plugin 'tpope/vim-obsession.git'
Plugin 'mattn/calendar-vim'
Plugin 'git://github.com/vim-python/python-syntax'
Plugin 'git://github.com/mhinz/vim-grepper'
Plugin 'git://github.com/ajh17/Spacegray.vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'jistr/vim-nerdtree-tabs.git'
"Plugin 'christoomey/vim-tmux-navigator'
Plugin 'preservim/nerdcommenter'
Plugin 'mhinz/vim-startify'
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'neoclide/coc.nvim'
Plugin 'kyazdani42/nvim-tree.lua'

" All of your Plugins must be added before the following line
call vundle#end()

