begin
  require 'irb/completion'
  require 'irb/ext/save-history'
  IRB.conf[:SAVE_HISTORY] = 1_000
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
  version = if ENV.key?('RBENV_ROOT')
              `rbenv version-name`.chomp
            else
              '%s-p%d' % [RUBY_VERSION, RUBY_PATCHLEVEL]
            end
  version = '>' if version.empty?
  IRB.conf[:PROMPT][:CUSTOM] = {
    :PROMPT_N => "#{version}> ",
    :PROMPT_I => "#{version}> ",
    :PROMPT_S => nil,
    :PROMPT_C => ' ?> ',
    :RETURN => " => %s\n"
  }
  IRB.conf[:PROMPT_MODE] = :CUSTOM
rescue LoadError
end
