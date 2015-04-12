function anybar --description 'Change the AnyBar.app status' \
                --argument-names color

    echo -n "$color" | nc -4u -w0 localhost 1738

end
