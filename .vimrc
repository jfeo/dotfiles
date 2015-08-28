"==================="
"=== Plugins ======="
"==================="

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'rdnetto/YCM-Generator'
Plugin 'Valloric/YouCompleteMe'
Plugin 'gmarik/Vundle.vim'      " plugin mangement
Plugin 'Raimondi/delimitMate'   " insert matching quotes, braces, etc.
Plugin 'bling/vim-airline'      " status bar
Plugin 'tpope/vim-commentary'   " help for commenting
Plugin 'scrooloose/syntastic'   " see compiler warnings in vim
Plugin 'lervag/vim-latex'       " latex support
Plugin 'tpope/vim-surround'     " surround selection with matching symbols
Plugin 'ajh17/Spacegray.vim'    " colours
Plugin 'SirVer/ultisnips'       " snippet-engine
Plugin 'honza/vim-snippets'     " snippets 
Plugin 'tpope/vim-fugitive'     " Use git from within vim
" Syntax highlighting
Plugin 'tikhomirov/vim-glsl'    " OpenGL Shading Language
Plugin 'StanAngeloff/php.vim'   " Better PHP syntax coloring
Plugin 'travitch/hasksyn'            " Haskell syntax
Plugin 'vim-ruby/vim-ruby'           " Ruby syntax
Plugin 'vim-scripts/vim-json-bundle' " JSON syntax
Plugin 'xolox/vim-misc'  " miscellaneous vim autoload scripts
Plugin 'xolox/vim-notes' " Note taking
Plugin 'newclear/vim-pyclewn'

call vundle#end()

"==================="
"=== General ======="
"==================="
filetype plugin indent on
syntax enable
set background=dark
color spacegray       " colorscheme
set laststatus=2      " enable vim-airline statusbar
set backspace=2       " delete newlines with backspace
" set expandtab         " indent with spaces
set shiftwidth=2      " number of spaces to use when indenting
set softtabstop=2     " number of spaces a tab counts for when inserting
set tabstop=2         " number of spaces a tab counts for
set smartindent       " automatically indent new lines
set foldenable        " enable folds
set number            " enable line numbers
set ruler             " enable column and line number display
set hlsearch          " enable search highlighting
au BufNewFile,BufRead *.fo setlocal ft=fasto
" match ErrorMsg '\%>80v.\+'
"======================="
"=== Keymapping ========"
"======================="
let mapleader=","
" reload .vimrc faster
noremap <leader>s :so ~/.vimrc<cr>
" close current window
noremap <leader>l :clo<cr>
" next buffer
noremap <leader>n :bn<cr>
" previous buffer
noremap <leader>p :bp<cr>
" delete buffer
 noremap <leader>d :bd<cr>
" Install plugins
noremap <leader>i :PluginInstall!<cr>
" Clear search
noremap <leader>c :let @/ = ""<cr>
" Create horizontal split window
noremap <leader>h :split<cr>
" Create vertical split window
noremap <leader>v :vs<cr>
" Resize horizontal split window
noremap <Right> :vertical resize +5<cr>
noremap <Left> :vertical resize -5<cr>
" Resize vertical split window
noremap <Down> :resize +5<cr>
noremap <Up> :resize -5<cr>
" Move correctly on wrapped lines
noremap j gj
noremap k gk

noremap <leader>gs :C step<cr>
"==================="
"=== Plugin Setup==="
"==================="

"=== vim-latex ==="
let g:Tex_DefaultTargetFormat = "pdf"     " vim-latex default target
let g:Tex_ViewRule_pdf        = "mupdf"   " vim-latex default viewer

"=== vim-airline ==="
let g:airline_powerline_fonts = 1         " enable powerline fonts for vim-airline

"=== ultisnips ==="
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:rehash256 = 1

"=== YouCompleteMe ==="
let g:ycm_server_keep_logfiles = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1

" ====== HIGHLIGHT ====== "
let s:activatedh = 0 
function! ToggleH()
    if s:activatedh == 0
        let s:activatedh = 1 
        match Search '\%>80v.\+'
    else
        let s:activatedh = 0 
        match none
    endif
endfunction

nnoremap <leader>q :call ToggleH()<CR>

" ========================================
" == Auto commands =======================
" ========================================
augroup highlightingLongLines
  autocmd!
  " autocmd FileType *        match ErrorMsg '\%>80v.\+'
  autocmd FileType calendar match none
  autocmd FileType conf     match none
  autocmd FileType css      match none
  autocmd FileType eruby    match none
  autocmd FileType haskell  match none
  autocmd FileType help     match none
  autocmd FileType html     match none
  autocmd FileType markdown match none
  autocmd FileType mkd      match none
  autocmd FileType objc     match none
  autocmd FileType objcpp   match none
  autocmd FileType php      match none
  autocmd FileType plaintex match none
  autocmd FileType qf       match none
  autocmd FileType sh       match none
  autocmd FileType sql      match none
  autocmd FileType tex      match none
  autocmd FileType text     match none
  autocmd FileType unite    match none
  autocmd FileType vimfiler match none
  autocmd FileType xhtml    match none
  autocmd FileType xml      match none
augroup END
