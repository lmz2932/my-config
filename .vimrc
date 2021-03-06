set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Code folding plugin
Plugin 'tmhedberg/SimpylFold'
" Color Scheme
Plugin 'altercation/vim-colors-solarized'
" NerdTree: A tree explorer plugin for vim
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Auto indent for Python
Plugin 'vim-scripts/indentpython.vim'
" Javascript plugin (syntax and format)
Plugin 'pangloss/vim-javascript'
" Auto complete plugin
Plugin 'Valloric/YouCompleteMe'
" Syntax check in Vim
Plugin 'scrooloose/syntastic'
" PEP8 standard checking for Python
Plugin 'nvie/vim-flake8'
" Powerfull status line
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99
" Code folding shortcut with the <space> key
nnoremap <space> za
" Show docstring for folded code
let g:SimpylFold_docstring_preview=1
" Avoid Issue #27 for SimpylFold
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Mapping C-g to toggle NERDTreeTabs
map <C-g> :NERDTreeTabsToggle<CR>
" Start Nerdtree automatically
let g:nerdtree_tabs_open_on_console_startup=1
" Don't close nerdtreetabs when it is the last window
let g:nerdtree_tabs_autoclose=0
" Files that nerdtree will ignore
let NERDTreeIgnore = ['\.pyc$', '\~$', '\.swp$']

" Configuration for scrooloose/syntastic plugin
" IMPORTANT!! $ sudo pip install flake8
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" YouCompleteMe configuration
" close the preview window after accepts the offered completion string
let g:ycm_autoclose_preview_window_after_completion = 1
" YCM: close the preview window after leave insertion mode automatically
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_python_binary_path = 'python'
" YCM shortcuts, <leader> represents for '\'
nnoremap <leader>n :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>m :YcmCompleter GoToDefinition<CR>
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>
nnoremap <leader>l :YcmDiags<CR>
" invoke omni completion by pressing ctrl+/ (ctrl+/ is recognized as C-_)        
inoremap <unique> <C-_> <C-X><C-O><C-P>
" omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
" auto-complete even in comments
let g:ycm_complete_in_comments = 1
" auto-complete when typing in string
let g:ycm_complete_in_strings = 1
" invoke auto-complete forcely by Ctrl + a
let g:ycm_key_invoke_completion = '<C-a>'

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Powerline status configuration
set t_Co=256
set laststatus=2
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\

" Python format and syntax check look pretty
syntax enable
let python_highlight_all=1

" Standard format support
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Vim file formatting
set encoding=utf-8
set fileformat=unix
set autoindent

" Ensure one line doesn’t go beyond 80 characters
set textwidth=79

" Show line number
set nu
set ruler
set hlsearch
set incsearch

" Change position of the window of :sp & :vsp
set splitbelow
set splitright

" color scheme setting should be the last config
set background=dark
colorscheme solarized
