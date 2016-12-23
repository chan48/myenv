syntax on
color elflord
set number
set hlsearch
set backspace=indent,eol,start
set fencs=utf-8,cp949
set tabstop=4
set autoindent
set laststatus=2

"""""""""" ysoftman_settings_start
" pathogen 설정
" 참고 https://github.com/tpope/vim-pathogen.git 
execute pathogen#infect()
filetype plugin indent on


" Vundle 설정
" 참고 https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'valloric/youcompleteme'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'powerline/fonts'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'joshdick/onedark.vim'
Plugin 'junegunn/fzf'

call vundle#end()            " required
filetype plugin indent on    " required


" 사용자 설정
syntax on
color elflord
set number
set hlsearch
set backspace=indent,eol,start
set fencs=utf-8,cp949
set tabstop=4
set autoindent
set laststatus=2

syntax on
let g:onedark_termcolors=256
colorscheme onedark

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" 단축키 설정
nmap <f5> :GoRun<cr>
nmap <f7> :GoBuild<cr>
nmap <c-i> :GoFmt<cr>
nmap <c-p> :GoImports<cr>
nmap <f12> :TagbarToggle<cr>
nmap <f10> :NERDTreeToggle<cr>
nmap <f3> :FZF<cr>

"""""""""" ysoftman_settings_end
