# Local.
PATH="$HOME/.local/bin:$PATH"
# Homebrew.
PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/python:$PATH"
# jsc.
PATH="$PATH:/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources"
# as.
PATH="$PATH:/$HOME/Library/Developer/flex_sdk_4/bin"
export PATH

if [[ -x /Applications/MacVim.app/Contents/MacOS/Vim ]]
then
  EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
elif [[ -x $HOME/Applications/MacVim.app/Contents/MacOS/Vim ]]
then
  EDITOR="$HOME/Applications/MacVim.app/Contents/MacOS/Vim"
else
  EDITOR="vim"
fi
export EDITOR
export VISUAL=$EDITOR
alias vim=$EDITOR
