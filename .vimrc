" Credits and sources {{{
" http://dougblack.io/words/a-good-vimrc.html
" https://github.com/davidpdrsn/dotfiles
" }}}
" Plugins {{{ 
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'rdnetto/YCM-Generator'  " Autocompletion
Plugin 'Valloric/YouCompleteMe' " Autocompletion
Plugin 'sjl/gundo.vim'          " graphical view of undo tree
Plugin 'kien/ctrlp.vim'         " Find stuff
Plugin 'gmarik/Vundle.vim'      " plugin mangement
Plugin 'Raimondi/delimitMate'   " insert matching quotes, braces, etc.
Plugin 'bling/vim-airline'      " status bar
Plugin 'tpope/vim-commentary'   " help for commenting
Plugin 'scrooloose/syntastic'   " see compiler warnings in vim
Plugin 'lervag/vimtex'          " latex support
Plugin 'tpope/vim-surround'     " surround selection with matching symbols
Plugin 'tomasr/molokai'         " colorscheme
Plugin 'SirVer/ultisnips'       " snippet-engine
Plugin 'honza/vim-snippets'     " snippets 
Plugin 'tpope/vim-fugitive'     " Use git from within vim
Plugin 'rking/ag.vim'           " The silver searcher
" Syntax highlighting
Plugin 'wannesm/wmnusmv.vim'         " NuSMV
Plugin 'tikhomirov/vim-glsl'         " OpenGL Shading Language
Plugin 'StanAngeloff/php.vim'        " PHP
Plugin 'travitch/hasksyn'            " Haskell syntax
Plugin 'vim-ruby/vim-ruby'           " Ruby syntax
Plugin 'vim-scripts/vim-json-bundle' " JSON syntax
Plugin 'xolox/vim-misc'  " miscellaneous vim autoload scripts
Plugin 'xolox/vim-notes' " Note taking
Plugin 'newclear/vim-pyclewn'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()
" }}}
" Colors {{{
colorscheme molokai       " bright colours!
syntax enable             " enable syntax processing
" }}}
" Spaces and tabs {{{
set expandtab         " indent with spaces
set shiftwidth=2      " number of spaces to use when indenting
set softtabstop=2     " number of spaces a tab counts for when inserting
set tabstop=2         " number of spaces a tab counts for
set smartindent       " automatically indent new lines
set backspace=2       " delete newlines with backspace
set modelines=1       " last line in file can be mode line
filetype indent on    " load filetype-specific indent files
filetype plugin on    " load filetype specific plugin files
"}}}
" UI Config {{{
set number                " enable line numbers
set ruler                 " enable column and line number display
set showcmd               " show command in bottom bar
set cursorline            " highlight current line
set wildmenu              " visual autocomplete for command menu
set lazyredraw            " redraw only when we need to
set laststatus=2          " enable vim-airline statusbar
" }}}
" Searching {{{
set incsearch             " search as characters are entered
set hlsearch              " highlight search matches
" clear search
noremap <leader>c :let @/ = ""<cr>
" }}}
" Folding {{{
set foldenable            " enable folds
set foldlevelstart=10     " open most folds by default
set foldnestmax=10        " 10 nested fold max
" space 
nnoremap <space> za
" }}}
" Movement {{{
" move correctly on wrapped lines
noremap j gj              
noremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" Resize horizontal split window
noremap <Right> :vertical resize +5<cr>
noremap <Left> :vertical resize -5<cr>
" Resize vertical split window
noremap <Down> :resize +5<cr>
noremap <Up> :resize -5<cr>

" }}}
" Leader Shortcuts {{{
let mapleader=","          " leader is comma
" toggle gundo
nnoremap <leader>u :GundoToggle<cr>
" open ag.vim
nnoremap <leader>a :Ag 
" reload .vimrc faster
noremap <leader>sv :source ~/.vimrc<cr>
" edit vimrc
noremap <leader>ev :e ~/.vimrc<cr>
" close current window
noremap <leader>l :clo<cr>
" next buffer
noremap <leader>n :bn<cr>
" previous buffer
noremap <leader>p :bp<cr>
" delete buffer
 noremap <leader>d :bd<cr>
" install plugin
noremap <leader>i :PluginInstall!<cr>
" create horizontal split window
noremap <leader>h :split<cr>
" create vertical split window
noremap <leader>v :vs<cr>
" toggle relative numbers
nnoremap <leader>r :call ToggleNumber()<cr>
" }}}
" Plugin Settings {{{
" CtrlP settings {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}
" vim-latex settings {{{
let g:vimtex_fold_enabledA = 0
let g:vimtex_view_method   = "mupdf"
" }}}
" vim-airline settings {{{
let g:airline_powerline_fonts = 1         " enable powerline fonts for vim-airline
" }}}
" ultisnips settings {{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:rehash256 = 1
" }}}
" YouCompleteMe settings {{{
let g:ycm_server_keep_logfiles = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
" }}}
" syntastic settings {{{
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
" }}}
" }}}
" Auto commands {{{
augroup configgroup
  autocmd!
  autocmd BufWritePre *.c,*.cpp,*.h,*.hpp,*.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
augroup END
" }}}
" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/.tmp,/var/tmp,/tmp
set writebackup
" }}}
" Custom Functions {{{
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
" vim:foldmethod=marker:foldlevel=0
