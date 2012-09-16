# Local.
PATH="$HOME/.local/bin:$PATH"
# Homebrew.
PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/python:$PATH"
# jsc.
PATH="$PATH:/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources"
# ActionScript.
PATH="$PATH:/$HOME/Library/Developer/flex_sdk_4/bin"
export PATH

# MacVim.
EDITOR=$(command -v {~,}/Applications/MacVim.app/Contents/MacOS/Vim | head -1)
EDITOR=${EDITOR:=vim}
export EDITOR
export VISUAL=$EDITOR
alias vim=$EDITOR

# Ruby 1.9.3-p194-perf
#
# https://gist.github.com/1688857
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000
