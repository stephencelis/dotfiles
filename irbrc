begin
  require "#{ENV['HOME']}/.irb/wirble/lib/wirble"
  Wirble.init
  Wirble.colorize
rescue LoadError
  require 'irb/completion'
  require 'irb/ext/save-history'
end unless RUBY_PLATFORM =~ /darwin/
