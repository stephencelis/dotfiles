#!/bin/sh

path=$(pwd -P)

for each in $(echo * | sort | awk '{gsub(/README|install.sh/,"");print}'); do
  if [[ $each != 'install.sh' ]] && [[ $each != 'README' ]]; then
    echo Installing .$each into $HOME...
    if [[ -f $HOME/.$each ]] || [[ -d $HOME/.$each ]]; then
      [[ $stdin != 'a' ]] && printf "Exists. Overwrite? [yNaq] " && read stdin
      [[ $stdin == 'q' ]] && exit
      if [[ $stdin == 'a' ]] || [[ $stdin == 'y' ]]; then
        echo 'Overwriting...'
        rm $HOME/.$each
        ln -s $path/$each $HOME/.$each
      fi
    else
      ln -s $path/$each $HOME/.$each
    fi
  fi
done
