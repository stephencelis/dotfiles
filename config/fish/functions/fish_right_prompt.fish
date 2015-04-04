function fish_right_prompt --description 'Write out the right-hand prompt'
    if contains fry (functions)
        set -l color (set_color 111)
        set -l normal (set_color normal)

        echo $color(fry current)$normal
    end
end
