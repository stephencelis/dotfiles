# * Paths

if [[ -x /usr/libexec/path_helper ]]
then
  eval `/usr/libexec/path_helper -s`
fi

PATH="/usr/local/bin:/usr/local/sbin:$PATH"
PATH="/usr/local/share/npm/bin:$PATH"
PATH="$HOME/.gem/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"

if [[ -n $rvm_path ]]
then
  . "$rvm_path/environments/$rvm_ruby_string"
fi

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
