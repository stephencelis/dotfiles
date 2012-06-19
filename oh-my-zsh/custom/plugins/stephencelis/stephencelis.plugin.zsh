if [[ -f $HOME/.zsh-local ]]
then
  source $HOME/.zsh-local
fi

Code="$HOME/Documents/Code"
c() { cd $Code; for match in $*; do eval cd "$match*(/,@[1])"; done }
_c() { _files -W $Code -/ }
compdef _c c

unsetopt correct_all

alias which="builtin which -a"

export PATH="$(dirname $0)/bin:$PATH"
