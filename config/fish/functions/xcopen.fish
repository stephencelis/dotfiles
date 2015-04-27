function xcopen --description 'Open the nearest Xcode workspace or project'
    if count $argv > /dev/null
        open -a Xcode $argv
        return
    end

    pushd *.{xcworkspace,xcodeproj}
    and open .
    and popd
    or \
    if test $PWD != /
        pushd ..
        xcopen
        popd
    end
end
