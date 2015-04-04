function fish_title --description 'Write out a proper window title'
    printf '\a\e]7;file:///%s' (echo -n $PWD | sed 's/ /%20/g')
end
