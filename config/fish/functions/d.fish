function d --description 'Like z but d'
    pushd $DEVELOPER

    test "$argv" != ""
    and set -l translated (echo $argv | tr ' ' '/')
    and set -l query "-q $translated"

    set -l matches ( \
        find * \
        -maxdepth 1 \
        -type d \
        -print \
        2> /dev/null \
        | fzf \
        -1 \
        $query \
    )

    if test "$matches" != ""
        cd $matches[1]
    else
        popd
        return 1
    end
end
