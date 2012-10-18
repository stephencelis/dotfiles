unsetopt correct_all
setopt no_hist_verify

export PATH="$(dirname $0)/bin:$PATH"

# Glob search.
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

# Aliases.
alias ssh-add-all="ssh-add ~/.ssh/*id_rsa"

# Quickly toggle your editor with ^Z.
function foreground-editor { fg $EDITOR 2>/dev/null }
zle -N foreground-editor
bindkey '^Z' foreground-editor

# ~Code completion.
Code="$HOME/Documents/Code"
function c { cd $Code; for match in $*; do eval cd "$match*(/,@[1])"; done }
function _c { _files -W $Code -/ }
compdef _c c

# pass completion.
function _pass {
  compadd $(security dump-keychain | grep '"srvr"' | cut -d '"' -f 4 -)
}
compdef _pass pass

function weather {
  echo -n "\n${1:=SFO}\nX" |
    nc rainmaker.wunderground.com 23 |
    tail -n +18 |
    head -22
}

# http://blog.plenz.com/2012-01/zsh-complete-words-from-tmux-pane.html
function _tmux_pane_words {
  local expl
  local -a w
  if test -z "$TMUX_PANE"
  then
    return 1
  fi
  w=( ${(u)=$(tmux capture-pane \; show-buffer \; delete-buffer)} )
  _wanted values expl 'words from current tmux pane' compadd -a w
}
zle -C tmux-pane-words-prefix   complete-word _generic
zle -C tmux-pane-words-anywhere complete-word _generic
bindkey '^Xt' tmux-pane-words-prefix
bindkey '^X^X' tmux-pane-words-anywhere
zstyle ':completion:tmux-pane-words-(prefix|anywhere):*' completer \
  _tmux_pane_words
zstyle ':completion:tmux-pane-words-(prefix|anywhere):*' ignore-line \
  current
zstyle ':completion:tmux-pane-words-anywhere:*' matcher-list \
  'b:=* m:{A-Za-z}={a-zA-Z}'

if test -f $HOME/.zsh-local
then
  source $HOME/.zsh-local
fi
