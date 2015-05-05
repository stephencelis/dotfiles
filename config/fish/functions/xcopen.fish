function xcopen --description 'Open the nearest Xcode workspace or project'
    if count $argv > /dev/null
        open -a Xcode $argv
        return
    end

    pushd *.{xcworkspace,xcodeproj}
    and open .
    and set success 'true'
    and popd
    and return 0
    or \
    if test $PWD != /
        pushd ..
        xcopen
        popd
    else if test "$success" != 'true'
        echo "xcopen: No workspace or project found." >&2
        return 1
    end
end
