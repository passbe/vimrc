" passbe vimrc
set history=500
set background=dark
set shiftwidth=4
set tabstop=4
set noexpandtab " Use tabs not spaces
set autoindent
set smarttab
set backspace=indent,eol,start
set autoread						
set wildmenu						
set wildmode=list:full			
set ruler							
set cmdheight=2
set hidden
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set foldenable
set foldlevelstart=99
set foldcolumn=1
set foldmethod=indent
set spell spelllang=en_au
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
set number
set showcmd
set laststatus=2
set undodir=~/.vim/undo
set ttyfast
set cpoptions+=$
set t_Co=256
set noshowmode
set noinfercase
set completeopt=longest,menuone,noinsert
set shortmess+=c
set cursorline
set omnifunc=ale#completion#OmniFunc

let mapleader = "\<Space>"
let g:solarized_termcolors=256

syntax enable
filetype plugin on
filetype indent on
colorscheme solarized " https://github.com/altercation/vim-colors-solarized

" Save current buffer
noremap <leader>w :w<cr>

" Saves current file when no permission
command W w !sudo tee % > /dev/null

" Cycle between last two open buffers
noremap <leader><leader> <c-^>

" Open / close folds
nnoremap <leader>f za

" Buffer next
noremap <S-tab> :bnext<CR>

" Buffer destroy
noremap ` :Bdelete<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Ctrl-P search for file
nnoremap <silent> ; :CtrlP<CR>

" Ctrl-P search for buffer
nnoremap <silent> <tab> :CtrlPBuffer<CR>

" CtrlP ignore .git
let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Store|git|hg|svn|node_modules)$'
let g:ctrlp_working_path_mode = 'r'
 
" tslime
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_ruby_rubocop_options = '--except Layout/Tab, Layout/IndentationWidth'
let g:ale_change_sign_column_color = 1

" mucomplete
let g:mucomplete#enable_auto_at_startup = 0

" Lightline + ALE
let g:lightline ={}
let g:lightline.component_expand = {
\  'linter_checking': 'lightline#ale#checking',
\  'linter_warnings': 'lightline#ale#warnings',
\  'linter_errors': 'lightline#ale#errors',
\  'linter_ok': 'lightline#ale#ok',
\ }
let g:lightline.component_type = {
\     'linter_checking': 'left',
\     'linter_warnings': 'warning',
\     'linter_errors': 'error',
\     'linter_ok': 'left',
\ }
let g:lightline.active = { 'right': [
\		['lineinfo'],
\		['percent'],
\		['fileformat', 'fileencoding', 'filetype'],
\ 		[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
\ ] }

packloadall " Load all plugins
silent! helptags ALL " Load all of the helptags now, after plugins have been loaded.
