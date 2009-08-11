. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# -- start rip config -- #
RIPDIR=/Users/stephen/.rip
RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="$PATH:$RIPDIR/active/bin"
export RIPDIR RUBYLIB PATH
# -- end rip config -- #
