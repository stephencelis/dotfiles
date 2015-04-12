function d --description 'Like z, but d'
    cd $DEVELOPER
    for dir in $argv
        cd $dir*/
        or begin
            echo "fish: No matches for wildcard '$dir*/'." >&2
            return 1
        end
    end
end
