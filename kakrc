colorscheme base16-feomod

# plugins
source ~/.config/kak/plugins/plug.kak/rc/plug.kak
plug "andreyorst/plug.kak" noload
plug 'andreyorst/powerline.kak' %{
    hook -once global WinCreate .* %{
        powerline-format git bufname filetype mode_info line_column position
    }
}

plug "ul/kak-lsp" do %{
    cargo build --release --locked
    cargo install --force --path .
} config %{
    set-option global lsp_diagnostic_line_error_sign '║'
    set-option global lsp_diagnostic_line_warning_sign '┊'

    define-command ne -docstring 'go to next error/warning from lsp' %{ lsp-find-error --include-warnings }
    define-command pe -docstring 'go to previous error/warning from lsp' %{ lsp-find-error --previous --include-warnings }
    define-command ee -docstring 'go to current error/warning from lsp' %{ lsp-find-error --include-warnings; lsp-find-error --previous --include-warnings }

    define-command lsp-restart -docstring 'restart lsp server' %{ lsp-stop; lsp-start }

    hook global WinSetOption filetype=(c|cpp|rust|typescript|javascript|python) %{
        set-option window lsp_auto_highlight_references true
        set-option window lsp_hover_anchor false
        lsp-auto-hover-enable
        lsp-enable-window
    }

    hook global WinSetOption filetype=(rust) %{
        set-option window lsp_server_configuration rust.clippy_preference="on"
    }

    hook global WinSetOption filetype=rust %{
        hook window BufWritePre .* %{
            evaluate-commands %sh{
                test -f rustfmt.toml && printf lsp-formatting-sync
            }
        }
    }

    hook global KakEnd .* lsp-exit
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
map -docstring "lsp commands" global user l ':enter-user-mode lsp<ret>'
map -docstring "split horizontally" global user \" ':tmux-terminal-horizontal kak -c %val{session}<ret>'
map -docstring "split vertically" global user \% ':tmux-terminal-vertical kak -c %val{session}<ret>'

# options
set-option global ui_options ncurses_assistant=off # disable clippy

# indentation
set-option global tabstop 4
set-option global indentwidth 4

# line rendering
add-highlighter global/ number-lines -relative
add-highlighter global/ wrap
