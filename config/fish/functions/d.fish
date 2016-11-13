function d --description 'Like z, but d'
    cd $DEVELOPER
    for dir in $argv
        set -l matches $dir*/

        if [ -n "$matches" ]
            cd $matches[1]
        else
            echo "fish: No matches for wildcard '$dir*/'." >&2
            return 1
        end
    end
end
