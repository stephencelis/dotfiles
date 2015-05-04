# we're already acquainted, thanks
set -e fish_greeting

# universal
set -x PATH $HOME/.local/bin $PATH
set -x EDITOR vim
set -x VISUAL $EDITOR

set -x __fish_git_prompt_show_informative_status 1

# local
set -x DEVELOPER ~/Developer

# aliases
alias ag 'ag --smart-case'
alias rm 'trash'

# ruby
if test -f /usr/local/share/fry/fry.fish
    source /usr/local/share/fry/fry.fish
end
