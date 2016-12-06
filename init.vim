" Credits and sources {{{
" http://dougblack.io/words/a-good-vimrc.html
" https://github.com/davidpdrsn/dotfiles
" }}}
" Plugins {{{
call plug#begin('~/.config/nvim/plugins')

Plug 'Valloric/YouCompleteMe' " Autocompletion
Plug 'sjl/gundo.vim'          " graphical view of undo tree
Plug 'kien/ctrlp.vim'         " Find stuff
Plug 'gmarik/Vundle.vim'      " plugin mangement
Plug 'Raimondi/delimitMate'   " insert matching quotes, braces, etc.
Plug 'bling/vim-airline'      " status bar
Plug 'tpope/vim-commentary'   " help for commenting
Plug 'scrooloose/syntastic'   " see compiler warnings in vim
Plug 'lervag/vimtex'          " latex support
Plug 'tpope/vim-surround'     " surround selection with matching symbols
Plug 'SirVer/ultisnips'       " snippet-engine
Plug 'honza/vim-snippets'     " snippets
Plug 'tpope/vim-fugitive'     " Use git from within vim
Plug 'rking/ag.vim'           " The silver searcher
Plug 'sukima/xmledit'         " XML editing functionality (tag closing, etc.)
Plug 'chrisbra/DistractFree'  " Distraction free mode

" Syntax highlighting
Plug 'chriskempson/base16-vim'
Plug 'wannesm/wmnusmv.vim'         " NuSMV
Plug 'tikhomirov/vim-glsl'         " OpenGL Shading Language
Plug 'StanAngeloff/php.vim'        " PHP
Plug 'travitch/hasksyn'            " Haskell syntax
Plug 'vim-ruby/vim-ruby'           " Ruby syntax
Plug 'vim-scripts/vim-json-bundle' " JSON syntax
Plug 'xolox/vim-misc'  " miscellaneous vim autoload scripts
Plug 'xolox/vim-notes' " Note taking
Plug 'newclear/vim-pyclewn'
Plug 'jcfaria/Vim-R-plugin' " R language
Plug 'jaxbot/semantic-highlight.vim'

call plug#end()
" }}}
" Colors {{{
syntax enable              " enable syntax processing

" base16 color stuff
let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]
let base16colorspace=256
set t_Co=256

set background=dark
colorscheme base16-default-dark
" select colorscheme from dynamic-colors selected color
" let cs = split(readfile("/home/feo/.dynamic-colors/colorscheme")[0], '\.')
" let mstr = matchstr(cs[1], 'dark')
" if empty(mstr)
"   set background=light
" else
"   set background=dark
" endif
" execute 'colorscheme ' . cs[0] . '-' . cs[1]
"}}}
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
set list
set listchars=tab:▸\              " Char representing a tab
set listchars+=extends:❯          " Char representing an extending line
set listchars+=nbsp:␣             " Non breaking space
set listchars+=precedes:❮         " Char representing an extending line in the other direction
set listchars+=trail:·            " Show trailing spaces as dots
" }}}
" Searching {{{
set incsearch             " search as characters are entered
set hlsearch              " highlight search matches
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
" while allowing counted g/j
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

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
noremap <leader>sv :source ~/.config/nvim/init.vim<cr>
" edit vimrc
noremap <leader>ev :e ~/.config/nvim/init.vim<cr>
" close current window
noremap <leader>l :clo<cr>
" next buffer
noremap <leader>n :bn<cr>
" previous buffer
noremap <leader>p :bp<cr>
" delete buffer
noremap <leader>d :bd<cr>
" CtrlP buffer selection
noremap <leader>b :CtrlPBuffer<cr>
" install plugin
noremap <leader>i :PlugInstall!<cr>
" create horizontal split window
noremap <leader>h :split<cr>
" create vertical split window
noremap <leader>v :vs<cr>
" toggle relative numbers
nnoremap <leader>r :call ToggleNumber()<cr>
" clear search
noremap <leader>c :let @/ = ""<cr>
" terminal escape
tnoremap <Esc>q <C-\><C-n>
" }}}
" Plugin Settings {{{
" CtrlP settings {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}
" vimtex settings {{{
let g:vimtex_fold_enabledA = 0
let g:vimtex_view_method   = "mupdf"
" }}}
" vim-airline settings {{{
let g:airline_powerline_fonts = 1         " enable powerline fonts for vim-airline
" }}}
" ultisnips settings {{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<M-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:rehash256 = 1
" }}}
" YouCompleteMe settings {{{
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/plugins/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_server_keep_logfiles = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
" }}}
" syntastic settings {{{
" let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
" let g:syntastic_java_javac_classpath = '/opt/android-sdk/platforms/android-23/*.jar'
" let g:syntastic_enable_signs = 0
" let g:syntastic_enable_balloons = 0
" let g:syntastic_enable_highlighting = 0
" let g:syntastic_mode_map = { "mode": "passive" }
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" }}}
" }}}
" Auto commands {{{
augroup configgroup
  autocmd!
  autocmd BufWritePre *.c,*.cpp,*.h,*.hpp,*.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
  autocmd FileType *.php,*.html,*.html,*.xml :
  autocmd BufReadPost *.tex setlocal textwidth=80
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
endfunction
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
