export PROMPT=$'%2~ %{$bold_color%}$(prompt_git_info)%{${reset_color}%}%% '
export RPROMPT=$'$(~/.rvm/bin/rvm-prompt)'

PATH="/usr/local/bin:/user/local/mysql/bin:$PATH"
PATH="$HOME/.gem/bin:$PATH"
PATH="$HOME/.homebrew/bin:$HOME/.homebrew/sbin:$PATH"
PATH="$HOME/.local/MagLev-22578.MacOSX/bin:$PATH"
PATH="$HOME/.local/flex_sdk_3/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
export PATH

export MANPATH="/usr/local/man:$MANPATH"
export CODEPATH="$HOME/Documents/Code"
export GEMPATH=`gem env gemdir`

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
