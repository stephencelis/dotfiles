function unquarantine --description 'Unquarantines files'
    xattr -r -d com.apple.quarantine $argv
end
