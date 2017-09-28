# env
set -x GOPATH $HOME/go

# git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'

# git status chars
set __fish_git_prompt_char_dirtystate '!'
set __fish_git_prompt_char_stagedstate 'a'
set __fish_git_prompt_char_untrackedfiles '?'
set __fish_git_prompt_char_stashstate 's'
set __fish_git_prompt_char_upstream_ahead 'c'
set __fish_git_prompt_char_upstream_behind '-'
