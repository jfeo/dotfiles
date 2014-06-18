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
Plugin 'git://git.code.sf.indent/p/vim-latex/vim-latex'
Plugin 'altercation/vim-colors-solarized'
Plugin 'SirVer/ultisnips'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'junegunn/goyo.vim'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

call vundle#end()
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"==================="
"=== General ======="
"==================="

"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
filetype plugin indent on
syntax enable
set background=light
let g:solarized_termcolors=256
colorscheme solarized " colorscheme
set backspace=2       " delete newlines with backspace
set expandtab         " indent with spaces
set shiftwidth=2      " number of spaces to use when indenting
set softtabstop=2     " number of spaces a tab counts for when inserting
set tabstop=2         " number of spaces a tab counts for
set smartindent       " automatically indent new lines
set foldenable        " enable folds
set number            " enable line numbers
set ruler             " enable column and line number display

highlight OverLength ctermbg=blue ctermfg=white guibg=#592929
"let columncolour OverLength /\%81v.\+/
let &colorcolumn="80,".join(range(81,999),",")
"======================="
"=== Keymapping ========"
"======================="
" reload .vimrc faster
noremap <leader>so :so ~/.vimrc<cr>
" run current window in a python2 or python3 shell
noremap <leader>cl :!clear<cr><cr>
noremap <leader>p3 :!python %:p<cr> 
noremap <leader>p2 :!python2 %:p<cr>
" split horizontal
"noremap <C-b> :split<cr>
" split vertical
"noremap <C-v> :vs<cr>
" close current window
noremap <C-l> :clo<cr>
" next buffer
noremap <C-n> :bn<cr>
" previous buffer
noremap <C-p> :bp<cr>
" delete buffer
noremap <C-d> :Kwbd<cr>
" Goyo mode
noremap <C-f> :Goyo<cr>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"==================="
"=== Other stuff ==="
"==================="
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf        = "evince"

"================="
"=== Functions ==="
"================="
"function ToggleBackgroundColour ()
"   if (&background == 'light')
"      set background=dark
"      echo "background -> dark"
"   else
"      set background=light
"      echo "background -> light"
"   endif
"   colorscheme solarized
"endfunction

"here is a more exotic version of my original Kwbd script
"delete the buffer; keep windows; create a scratch buffer if no buffers left
function s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        enew
        let l:newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif
    if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
      execute "bd! " . s:kwbdBufNum
    endif
    if(!s:buflistedLeft)
      set buflisted
      set bufhidden=delete
      set buftype=
      setlocal noswapfile
    endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction

command! Kwbd call s:Kwbd(1)
nnoremap <silent> <Plug>Kwbd :<C-d>Kwbd<CR>
