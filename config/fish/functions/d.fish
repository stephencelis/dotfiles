function d --description 'Like z, but d'
    cd $DEVELOPER
    for dir in $argv
        cd $dir*/
    end
end
