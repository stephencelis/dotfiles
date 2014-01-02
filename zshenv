# Path

# Local
PATH="$HOME/.local/bin:$PATH"
# Homebrew
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
PATH="$PATH:/usr/local/share/python"
PATH="$PATH:/usr/local/share/npm/bin"
# Plan9
PATH="$PATH:/usr/local/plan9/bin"
# jsc
PATH="$PATH:/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources"
# Heroku
PATH="$PATH:/usr/local/heroku/bin"
export PATH

# MacVim

EDITOR=$(command -v {~,}/Applications/MacVim.app/Contents/MacOS/Vim | head -1)
EDITOR=${EDITOR:=vim}
export EDITOR
export VISUAL=$EDITOR
alias vim=$EDITOR

# Ruby

export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
command -v rbenv >/dev/null && eval "$(rbenv init - --no-rehash zsh)"

# export RUBY_CG_HEAP_MIN_SLOTS=1000000
# export RUBY_HEAP_SLOTS_INCREMENT=1000000
# export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
# export RUBY_GC_MALLOC_LIMIT=100000000
# export RUBY_HEAP_FREE_MIN=500000
