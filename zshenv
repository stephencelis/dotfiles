# * Paths
PATH="/usr/local/bin:$PATH"
PATH="$HOME/.gem/bin:$PATH"
PATH="$HOME/.brew/bin:$HOME/.brew/sbin:$PATH"
PATH="$HOME/.local/bin:$PATH"
# PATH="bin:$PATH"
export PATH

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
