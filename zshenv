# * Paths
# if [[ -x /usr/libexec/path_helper ]]
# then
#   eval `/usr/libexec/path_helper -s`
# fi

PATH="$HOME/.rbenv/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="/usr/local/share/python:$PATH"
PATH="$PATH:/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources"
PATH="$PATH:/$HOME/Library/Developer/flex_sdk_4/bin"
export PATH

eval "$(rbenv init -)"

export CODEPATH="$HOME/Documents/Code"

# * Editing
if [[ -x /Applications/MacVim.app/Contents/MacOS/Vim ]]
then
  VISUAL="/Applications/MacVim.app/Contents/MacOS/Vim"
elif [[ -x $HOME/Applications/MacVim.app/Contents/MacOS/Vim ]]
then
  VISUAL="$HOME/Applications/MacVim.app/Contents/MacOS/Vim"
else
  VISUAL="vim"
fi
export VISUAL
export EDITOR=$VISUAL

# * ZSH configuration
#
# Use colors in `ls`.
export CLICOLOR=1

# Stop at "/" when meta-navigating.
export WORDCHARS="${WORDCHARS:s#/#}"
