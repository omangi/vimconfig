""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Pathogen plugin
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin on
filetype indent on

"Show line number
set nu

"Set tab space
set tabstop=4

"Tab size on autoindent
set shiftwidth=4

"Converts tab in spaces
set expandtab

"Tab delele on backspace
set smarttab

"Syntax
syntax on

"Allow mouse
set mouse=a

"Always show current position
set ruler

" Configure backspace so it acts as it should act (tmp)
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Mapping
noremap <C-N> :NERDTreeToggle <CR>
noremap <C-M> :NERDTreeFind <CR>
noremap <F3> :tabnew <CR>
noremap <F2> :tabclose <CR>

set laststatus=2
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Turn on the WiLd menu
set wildmenu

"heh:D
command Q q
command Qa  qa
command W w

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Help functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Highlight search results
set hlsearch
nnoremap <space> :noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins etc ...
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlP plugin 
set runtimepath^=~/.vim/bundle/ctrlp.vim

"default search type: filename
let g:ctrlp_by_filename = 1

"Ignoring files and dirs in ctrlp.vim (use according to your need)
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](conny|release|solrslave|tools|docs|tmp|data)$',
    \ 'file': '\v\.(txt|png|gif|jpg|psd|bat|jar)$',
    \ }

let g:ctrlp_match_window = 'results:100'

