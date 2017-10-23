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
set autoindent
set shiftwidth=4
set tabstop=4
set smarttab
set ttyfast
set cpoptions+=$
set t_Co=256
set relativenumber
set noshowmode
set noswapfile

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

filetype plugin indent on

" CtrlP ignore .git
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_working_path_mode = 'w'

" Ale
let g:ale_completion_enabled = 1
let g:ale_ruby_rubocop_options = '--except Layout/Tab,Layout/IdentationWidth'

" Lightline config
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'right': [ [ 'lineinfo' ],
\              [ 'percent' ],
\              [ 'linter_warnings', 'linter_errors', 'linter_ok' ],
\              [ 'fileformat', 'fileencoding', 'filetype' ] ]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'linter_warnings': 'warning',
\   'linter_errors': 'error',
\   'linter_ok': 'ok'
\ },
\ }

autocmd User ALELint call lightline#update()

" ale + lightline
function! LightlineLinterWarnings() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf('%d --', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf('%d >>', all_errors)
endfunction

function! LightlineLinterOK() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '✓' : ''
endfunction

" Load all plugins now.
packloadall
" Load all of the helptags now, after plugins have been loaded.
silent! helptags ALL
