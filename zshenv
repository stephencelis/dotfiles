export PROMPT=$'%2~ %{$bold_color%}$(prompt_git_info)%{${reset_color}%}%% '
export RPROMPT=$'%{${fg[white]}%}$(~/.rvm/bin/rvm-prompt)%{${reset_color}%}'

PATH="/usr/local/bin:/usr/local/mysql/bin:$PATH"
PATH="$HOME/.gem/bin:$PATH"
PATH="$HOME/.brew/bin:$HOME/.brew/sbin:$PATH"
PATH="$HOME/.local/MagLev-22578.MacOSX/bin:$PATH"
PATH="$HOME/.local/flex_sdk_3/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
# PATH="bin:$PATH"
export PATH

# export MANPATH="/usr/local/share/man:$MANPATH"
# export MANPATH="$HOME/.brew/share/man:$MANPATH"
# export MANPATH="$HOME/.local/share/man:$MANPATH"

export CODEPATH="$HOME/Documents/Code"

# Stop at "/" when meta-navigating.
export WORDCHARS="${WORDCHARS:s#/#}"

# Use colors in `ls'.
export CLICOLOR=1

# -- start rip config -- #
RIPDIR=$HOME/.rip
RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="$PATH:$RIPDIR/active/bin"
export RIPDIR RUBYLIB PATH
# -- end rip config -- #

# rvm-install added:
if [[ -s /Users/stephen/.rvm/scripts/rvm ]] ; then source /Users/stephen/.rvm/scripts/rvm ; fi

