"==================="
"=== Plugins ======="
"==================="

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/syntastic'
Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'


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

"=======================
"=== Other stuff ======="
"======================="

