set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" PLUGINS
Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'myusuf3/numbers.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'junegunn/rainbow_parentheses.vim'

" LANGUAGE PLUGINS:
Plugin 'derekwyatt/vim-scala'
Plugin 'wlangstroth/vim-racket'
Plugin 'python-mode/python-mode'


" -----------------------------
call vundle#end()
filetype plugin indent on

syntax on
colorscheme dracula
highlight Normal ctermbg=None
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" NERDTree SETTINGS
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&b:NERDTree.    isTabTree()) | q | endif

let NerdTreeShowHidden=1
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_racket_racket_checker = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++14'

let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'

set tabstop=4 shiftwidth=4 expandtab
