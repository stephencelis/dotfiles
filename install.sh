#!/bin/sh

path=$(pwd -P)

for each in $(echo * | awk '{gsub(/README|install.sh/,"");print}')
do
  if [[ $each != 'install.sh' ]] && [[ $each != 'README' ]]
  then
    echo Installing .$each into $HOME...
    if [[ -f $HOME/.$each ]] || [[ -d $HOME/.$each ]]
    then
      while [[ -z $stdin ]] || [[ $stdin == 'd' ]]
      do
        [[ $stdin == 'd' ]] && diff $path/$each $HOME/.$each
        [[ $stdin != 'a' ]] && printf "Exists. Overwrite? [yNdaq] " && read stdin
        [[ $stdin == 'q' ]] && exit
        if [[ $stdin == 'a' ]] || [[ $stdin == 'y' ]]
        then
          echo 'Overwriting...'
          ln -fs $path/$each $HOME/.$each
        fi
      done
      stdin=''
    else
      ln -s $path/$each $HOME/.$each
    fi
  fi
done
