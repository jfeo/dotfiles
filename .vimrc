"==================="
"=== Plugins ======="
"==================="

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-commentary'
"Plugin 'tpope/vim-surround'
"Plugin 'ervandew/supertab'
"Plugin 'scrooloose/syntastic'
Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'

"Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

call vundle#end()
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"==================="
"=== General ======="
"==================="

"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
filetype plugin indent on
syntax enable
colorscheme default   " colorscheme
set backspace=2       " delete newlines with backspace
set expandtab         " indent with spaces
set shiftwidth=2      " number of spaces to use when indenting
set softtabstop=2     " number of spaces a tab counts for when inserting
set tabstop=2         " number of spaces a tab counts for
set smartindent       " automatically indent new lines
set foldenable        " enable folds
set number            " enable line numbers
set ruler             " enable column and line number display

"======================="
"=== Keymapping ========"
"======================="
" reload .vimrc faster
noremap <leader>so :so ~/.vimrc<cr>
" run current window in a python2 or python3 shell
noremap <leader>p3 :!python %:p<cr> 
noremap <leader>p2 :!python2 %:p<cr>
" split horizontal
noremap <C-b> :split<cr>
" split vertical
noremap <C-v> :vs<cr>
" close current window
noremap <C-l> :clo<cr>
" next buffer
noremap <C-n> :bn<cr>
" previous buffer
noremap <C-p> :bp<cr>
" delete buffer
noremap <C-d> :bd<cr>

"==================="
"=== Other stuff ==="
"==================="
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf        = "mupdf"

"================="
"=== Functions ==="
"================="


