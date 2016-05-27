" General
set nocompatible					" Explicitly get out of vi-compatible mode
set history=1000					" Sets how many lines of history VIM has to remember
set autoread						" Set to auto read when a file is changed from the outside
set so=7							" Set 7 lines to the cursors - when moving vertical
set wildmenu						" Turn on wild menu
set wildmode=longest:full			" Make wild menu more like bash completion
set ruler							" Always show current position
set hidden							" Change buffers without saving
set backspace=indent,eol,start		" Set backspace config
set whichwrap+=<,>,h,l			    " ^^
set ignorecase						" Ignore case when searching
set smartcase						" ^^
set hlsearch						" Highlight search items
set incsearch						" Make search act like search in modern browsers
set spell spelllang=en_au		    " Turn on spelling
set magic							" Set magic on, for regular expressions
set showmatch						" Show matching brackets when text indicator is over them
set mat=2							" How many tenths of a second to blink
set noerrorbells					" No sound
set novisualbell					" ^^
set t_vb=							" ^^
set tm=500							" ^^
syntax enable						" Enable syntax
set gfn=Deja\ Vu\ Sans\ Mono\ 8. 	" Set font
set shell=/bin/bash					" Set shell
set fileformats=unix,mac,dos		" Set file formats
set fileformat=unix				    " Set main file format
set encoding=utf8					" Set encoding
set background=dark					" Set background colour
set number							" Show line numbers		
set showcmd							" Show command being typed
set linespace=1						" Extra pixels between lines
set laststatus=2					" Enable status line always
set nobackup						" No backup files
set nowb							" ^^
set noswapfile						" ^^
set undodir=~/.vim/undo				" Set undo directory
set expandtab						" No real tabs
set shiftwidth=4					" Auto indent amount
set tabstop=4						" Real tabs
set smarttab						" Smart tabs
set ai								" Auto indent
set si								" Smart indent
set ttyfast							" Faster terminal connection
set cpoptions+=$					" Replacement character
set t_Co=256				        " Allow 256 colours
set relativenumber                  " Turn on relative numbers

" GUI
if has("gui_running")
	set guioptions-=T 				" Turn off GUI toolbar
endif
autocmd! GUIEnter * set vb t_vb=    " MacVim no beep
let g:solarized_termcolors=256      " Set 256 colorscheme settings for Solarized
colorscheme solarized               " Set colorscheme

" Mappings
let mapleader = "\<Space>"
map Q gq							" Don't use Ex mode, use Q for formatting
noremap <S-tab> :bnext<CR>			" Buffer next
noremap ` :Bdelete<CR>					" Buffer Destroy
nnoremap <silent> ; :CtrlP<CR>      " Ctrl-P search for file
nnoremap <silent> <tab> :CtrlPBuffer<CR> " Ctrl-P search for buffer

" Vundle
filetype off                         " Set filetype off (required for Vundle)
set rtp+=~/.vim/bundle/Vundle.vim    " Set Vundle path
call vundle#begin()                  " Execute Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ngmy/vim-rubocop'
Plugin 'altercation/vim-colors-solarized'
Plugin 'moll/vim-bbye'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
call vundle#end()
filetype plugin indent on            " Requried for Vundle

" Set comment strings
autocmd FileType ruby set commentstring=#\ %s

" Disable whitespace warnings
let g:airline#extensions#whitespace#checks = ['indent']
let g:airline_theme = 'wombat'

" CtrlP ignore .git
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_working_path_mode = 'w'

" Specs
let g:rspec_command = 'call Send_to_Tmux("RAILS_ENV=test rspec --color --format documentation --require spec_helper ../{spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:tslime_always_current_session = 1 
let g:tslime_always_current_window = 1

