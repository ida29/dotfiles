set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx PATH $HOME/.claude/local $PATH
fish_add_path /opt/homebrew/opt/postgresql@16/bin
string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)
starship init fish | source

