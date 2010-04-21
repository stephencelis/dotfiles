# * Prompts
export PROMPT=$'%2~ %{$bold_color%}$(prompt_git_info)%{${reset_color}%}%% '

if [[ -s ~/.rvm/bin/rvm-prompt ]]
then
  export RPROMPT=$'%{${fg[white]}%}$(~/.rvm/bin/rvm-prompt)%{${reset_color}%}'
fi

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
