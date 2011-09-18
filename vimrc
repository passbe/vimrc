" General config
set nocompatible
set history=700
set autoread
set hidden
set so=7
set ruler
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set autochdir
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set mat=1
set cpoptions+=$ 
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set fileformats=unix,mac,dos
set fileformat=unix
set gfn=Consolas\ 9 
set shell=/bin/bash
set t_Co=256
set background=dark
colorscheme darkspectrum 
set number
set showcmd
set encoding=utf8
syntax on
set ttyfast
set nobackup
set nowb
set noswapfile
set directory=~/.vim/backup,/tmp
set undodir=~/.vim/undo
set wildmenu
set expandtab
set shiftwidth=3
set tabstop=3
set smarttab
set spell spelllang=en_au
set ai
set si
set linespace=1
set statusline=%F%m%r%h%w\ (%{&ff})\ \ \ \ %l:%L\ %p%%
set browsedir=buffer 

" Sets highlight cursor line (GUI) + turns off toolbar
if has("gui_running")
	set cursorline
	set guioptions-=T
endif

" Enable status line always
set laststatus=2

" Switch status bar color depending on mode
if version >= 700
  au InsertEnter * call InsertStatuslineColor(v:insertmode)
  au InsertLeave * hi StatusLine guibg=#3C3C3C
endif

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=#870000
  elseif a:mode == 'r'
    hi statusline guibg=#870000
  else
    hi statusline guibg=#870000
  endif
endfunction

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Buffer next prev
noremap <tab> :bnext<CR>
noremap <S-tab> :bprev<CR>

" Redraw
map <F4> :redraw!<CR>

" Buffer Destroy
noremap ` :bw<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Toggles wrap
nnoremap <silent> <F3>      :call ToggleWrap()<CR>
vnoremap <silent> <F3> <C-C>:call ToggleWrap()<CR>
inoremap <silent> <F3> <C-O>:call ToggleWrap()<CR>

function ToggleWrap()
    set wrap!
    echo &wrap ? 'wrap' : 'nowrap'
endfunc

" Nerd Tree
map ; :NERDTreeToggle ~/projects/<cr>

" Tags
map <F2> :TlistToggle<cr>

" NERDTree Options
let g:NERDTreeIgnore = ['.git', '.svn']
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeMinimalUI = 0
let g:NERDTreeDirArrows = 1

" Tag List
let g:Tlist_Auto_Highlight_Tag = 0
let g:Tlist_Enable_Fold_Column = 0
let g:Tlist_Inc_Winwidth = 40
let g:Tlist_Use_Right_Window = 1
let g:Tlist_Ctags_Cmd = '/usr/bin/ctags'
let g:Tlist_Show_One_File = 1

" Set omincomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

