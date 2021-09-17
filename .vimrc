" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.
runtime! debian.vim
let mapleader ="," 

"Plug-ins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'valloric/youcompleteme'
Plug 'junegunn/goyo.vim'
call plug#end()

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1
" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax enable
endif

" Have Vim jump to the last position when reopening a file.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" NERDTree
" Start NERDTree and put the cursor back in the other window
autocmd VimEnter * NERDTree | wincmd p
" Start NERDTree when Vim is started without file arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin on

set encoding=utf-8
set showcmd		" Show (partial) command in status line.
set path+=**
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set nohlsearch 		" Do not highlight search 
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set background=dark		" Set background color
colorscheme gruvbox    " Set color scheme
set number relativenumber	" Enable line number relative numbering  
set wildmenu            " Enable wildmenu
set wildmode=longest,list,full " Enable wildmode
"set cursorline          " Highlight current line 
set lazyredraw 		" Enable lazy redrawing of screen
set clipboard=unnamedplus
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set scrolloff=8
set noswapfile
set ruler
set undodir=~/.vim/undodir
set undofile
vnoremap <C-c> "+y
map <C-v> "+P

" Source a global configuration file if available
if filereadable("~/.vimrc")
  source ~/.vimrc
endif

set colorcolumn=80
set signcolumn=yes
highlight ColorColumn ctermbg=8 guibg=lightgrey
