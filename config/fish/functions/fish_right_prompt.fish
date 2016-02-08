function fish_right_prompt --description 'Write out the right-hand prompt'
    if contains rbenv (functions)
        set -l color (set_color 111)
        set -l normal (set_color normal)

        echo $color(rbenv version-name)$normal
    end
end
