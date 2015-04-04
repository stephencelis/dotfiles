function xcopen --description 'Open the nearest Xcode workspace or project'
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
