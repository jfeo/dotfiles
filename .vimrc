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
" close current window
noremap <leader>cl :clo<cr>
" run current window in a python3 shell
noremap <leader>p3 :Shell python %:p<cr> 
" buffer controls
noremap <leader>bn :bn<cr>
noremap <leader>bp :bp<cr>
noremap <leader>bd :bd<cr>

"==================="
"=== Other stuff ==="
"==================="
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf        = "mupdf"

"================="
"=== Functions ==="
"================="

" Run shell commands with output redirected to buffer window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)

function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  rightbelow new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:  ' . a:cmdline)
  call setline(2, 'Expanded to:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction
