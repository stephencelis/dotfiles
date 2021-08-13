# we're already acquainted, thanks
set fish_greeting ''

# universal
set -x PATH $PATH /usr/local/sbin
set -x PATH $HOME/.local/bin $PATH
set -x EDITOR vim
set -x VISUAL $EDITOR

set -x __fish_git_prompt_show_informative_status 1

set -x DEVELOPER ~/Developer

# local
test -f $HOME/.config/fish/local.fish
and source $HOME/.config/fish/local.fish

# aliases
alias be 'bundle exec'
alias f 'find * -type f | fzf | xargs'
alias gg 'git grep'
alias ack 'echo Did you mean \"rg\"\?; sleep 2; rg'
alias ag 'echo Did you mean \"rg\"\?; sleep 2; rg'

alias swift 'env PATH="/usr/bin:$PATH" swift'
alias xcrun 'env PATH="/usr/bin:$PATH" xcrun'

type -q trash
and alias rm 'trash'

# bat
alias cat 'bat'
set -x BAT_THEME GitHub

# exa
alias ls 'exa'

# fzf
fzf_key_bindings

# homebrew
set -x HOMEBREW_NO_ANALYTICS 1

# ruby
test -d $HOME/.rbenv
and source (rbenv init - | psub)
