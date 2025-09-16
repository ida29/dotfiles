set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx PATH $HOME/.claude/local $PATH
fish_add_path /opt/homebrew/opt/postgresql@16/bin
starship init fish | source
set -gx BACKLOG_DOMAIN (cat ~/.backlog_domain)
set -gx BACKLOG_API_KEY (cat ~/.backlog_key)
set -gx GEMINI_API_KEY (cat ~/.gemini_key)
function cc
  claude --dangerously-skip-permissions $argv
end

# Neovide aliases
alias nv='nvim'
alias nvi='neovide'

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/yida/.lmstudio/bin
# End of LM Studio CLI section

