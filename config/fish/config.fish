# we're already acquainted, thanks
set -e fish_greeting

# universal
set -x PATH $HOME/.local/bin $PATH
set -x EDITOR vim
set -x VISUAL $EDITOR

set -x __fish_git_prompt_show_informative_status 1

set -x DEVELOPER ~/Developer

# local
if test -f $HOME/.config/fish/local.fish
    source $HOME/.config/fish/local.fish
end

# aliases
alias ag 'ag --smart-case'

if type -q trash
    alias rm 'trash'
end

# ruby
if test -f /usr/local/share/fry/fry.fish
    source /usr/local/share/fry/fry.fish
end

# vagrant
set -x PATH /opt/vagrant/bin $PATH
