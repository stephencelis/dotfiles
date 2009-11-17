export PATH="$PATH:$HOME/.gem/bin:$HOME/.homebrew/bin:$HOME/.homebrew/sbin"

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
