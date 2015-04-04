function __d_complete_directory
    set -g dev_dir $DEVELOPER
    set dev_dirs (echo (commandline) | tr ' ' \n)
    set -e dev_dirs[1]

    for dir in $dev_dirs
        set -g dev_dir "$dev_dir/$dir"
    end

    if test -d $dev_dir
        command ls -d $dev_dir/*/ | xargs -n1 basename
    else
        command ls -d $dev_dir*/ | xargs -n1 basename
    end
end

complete -xc d -a "(__d_complete_directory)"
