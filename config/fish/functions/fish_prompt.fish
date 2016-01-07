function fish_prompt --description 'Write out the prompt'

    if test "$CMD_DURATION" -gt '100'
        set_color $fish_color_error

        if test "$CMD_DURATION" -lt '60000'
            printf '%.1fs ' (awk "BEGIN { print $CMD_DURATION / 1000 }")
        else if test "$CMD_DURATION" -lt '3600000'
            printf '%.1fm ' (awk "BEGIN { print $CMD_DURATION / 60000 }")
        else
            printf '%.1fh ' (awk "BEGIN { print $CMD_DURATION / 3600000 }")
        end
        set_color normal
    end

    set -l last_status $status

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    printf '%s ' (__fish_git_prompt ' %s')

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    echo -n '$ '

    set_color normal

end
