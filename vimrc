" General
set history=1000					
set autoread						
set wildmenu						
set wildmode=list:full			
set ruler							
set hidden
set backspace=indent,eol,start
set ignorecase
set smartcase
set hlsearch
set incsearch
set spell spelllang=en_au
set magic
set showmatch
syntax enable
set encoding=utf8
set background=dark
set number
set showcmd
set laststatus=2
set undodir=~/.vim/undo
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set autoindent
set smartindent
set ttyfast
set cpoptions+=$
set t_Co=256
set relativenumber
set noshowmode

" Theme
let g:solarized_termcolors=256
colorscheme solarized

" Mapping
let mapleader = "\<Space>"
" Don't use Ex mode, use Q for formatting
map Q gq
" Buffer next
noremap <S-tab> :bnext<CR>
" Buffer destroy
noremap ` :Bdelete<CR>
" Ctrl-P search for file
nnoremap <silent> ; :CtrlP<CR>
" Ctrl-P search for buffer
nnoremap <silent> <tab> :CtrlPBuffer<CR>

" Set comment strings
autocmd FileType ruby set commentstring=#\ %s

" Lightline config
let g:lightline = {
          \ 'colorscheme': 'wombat',
          \ }

" CtrlP ignore .git
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_working_path_mode = 'w'
