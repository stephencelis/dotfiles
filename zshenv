# * Paths

# if [[ -x /usr/libexec/path_helper ]]
# then
#   eval `/usr/libexec/path_helper -s`
# fi

PATH="/usr/local/sbin:$PATH"
PATH="$HOME/.rbenv/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$PATH:/$HOME/Library/Developer/flex_sdk_4/bin"
export PATH

eval "$(rbenv init -)"

export CODEPATH="$HOME/Documents/Code"

# * Editing
export VISUAL="vim"
export EDITOR="vim"

# * ZSH configuration
#
# Use colors in `ls`.
export CLICOLOR=1

# Stop at "/" when meta-navigating.
export WORDCHARS="${WORDCHARS:s#/#}"
