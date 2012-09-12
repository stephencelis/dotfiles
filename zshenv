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
