""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings and SET's
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

"Search with insensitive
set ic

" Configure backspace so it acts as it should act (tmp)
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mapping's
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Height of the command bar
set cmdheight=2


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

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

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set noswapfile
