# we're already acquainted, thanks
set -e fish_greeting

# universal
set -x PATH $PATH /usr/local/sbin
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
alias gg 'git grep'

if type -q trash
    alias rm 'trash'
end

# swift
set -x PATH /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin \
    $PATH


# go
set -x GOPATH $DEVELOPER/_go
set -x PATH /usr/local/opt/go/libexec/bin $PATH
set -x PATH $GOPATH/bin $PATH

# ruby
if test -d ~/.rbenv
    source (rbenv init - | psub)
end

# vagrant
set -x PATH /opt/vagrant/bin $PATH
