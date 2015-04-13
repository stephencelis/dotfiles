function md --description 'A markdown reader'
    pandoc --standalone --from markdown --to man $argv \
        | groff -T utf8 -man - \
        | less -RS
end
