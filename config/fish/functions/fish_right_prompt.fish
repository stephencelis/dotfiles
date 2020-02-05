function fish_right_prompt --description 'Write out the right-hand prompt'
    defaults read (xcode-select -p)/../Info CFBundleShortVersionString 2>/dev/null | sed 's/^/🔨/'
end
