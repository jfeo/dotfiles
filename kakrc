colorscheme base16

# plugins
source ~/.config/kak/plugins/plug.kak/rc/plug.kak
plug 'andreyorst/powerline.kak' %{
    hook -once global WinCreate .* %{
        powerline-format git bufname filetype mode_info line_column position
    }
}


hook global WinCreate .* %{
	# add brackets highlighting
    add-highlighter window/ show-matching
    add-highlighter window/ show-whitespaces

    # select completion with tab
    hook global InsertCompletionShow .* %{
        map window insert <tab> <c-n>; map window insert <s-tab> <c-p>
    }
    hook global InsertCompletionHide .* %{
        unmap window insert <tab> <c-n>; unmap window insert <s-tab> <c-p>
    }
}

# yank/delete/cut to system clipboard
hook global NormalKey y|d|c %{ nop %sh{
    printf %s "$kak_main_reg_dquote" | xsel --input --clipboard
}}

# python options
hook global WinSetOption filetype=python %{
    set global lintcmd kak_pylint
    set global formatcmd yapf
    lint-enable
}

# comment lines
map global normal <a-m> %{_:try comment-block catch comment-line<ret>}

# user mappings
map -docstring "expand tabs to spaces" global user e '|expandtabs %opt{tabstop}<a-!><ret>'
map -docstring "reload user configuration" global user r ':source ~/.config/kak/kakrc<ret>' 
map -docstring "x11 clipboard paste before selection" global user P '!xsel --output --clipboard<ret>'
map -docstring "x11 clipboard paste after selection" global user p '<a-!>xsel --output --clipboard<ret>'
map -docstring "next buffer" global user n ':buffer-next<ret>'
map -docstring "previous buffer" global user b ':buffer-previous<ret>'
map -docstring "open buffer list" global user t ':buffer '

# setup language server protocol
eval %sh{kak-lsp --kakoune -s $kak_session}

# options
#set-option global modelinefmt '%sh{date}'
set-option global scrolloff 10,10 # keep space around cursor
set-option global ui_options ncurses_assistant=off # disable clippy

# indentation
set-option global tabstop 4
set-option global indentwidth 4

# line rendering
add-highlighter global/ number-lines -relative
add-highlighter global/ wrap
