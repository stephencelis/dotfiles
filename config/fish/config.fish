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
alias f 'find * -type f | fzf | xargs'
alias be 'bundle exec'
alias gg 'git grep'
alias ack 'echo Did you mean \"rg\"\?; sleep 2; rg'
alias ag 'echo Did you mean \"rg\"\?; sleep 2; rg'

if type -q trash
    alias rm 'trash'
end

# swift
test -d /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin
and set -x PATH \
    /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin $PATH

# ghc
test -d $HOME/.cabal/bin
and set -x PATH $PATH $HOME/.cabal/bin

# go
set -x GOPATH $DEVELOPER/_go
test -d /usr/local/opt/go/libexec/bin
and set -x PATH /usr/local/opt/go/libexec/bin $PATH
test -d $GOPATH/bin
and set -x PATH $GOPATH/bin $PATH

# homebrew
set -x HOMEBREW_NO_ANALYTICS 1

# ruby
test -d $HOME/.rbenv
and source (rbenv init - | psub)

# test -d $HOME/.psvm/current/bin
# and set -x PATH $HOME/.psvm/current/bin $PATH

# vagrant
test -d /opt/vagrant/bin
and set -x PATH /opt/vagrant/bin $PATH

# opam
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
eval (opam config env)
