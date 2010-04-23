require 'irb/completion'

begin
  require "#{ENV['HOME']}/.irb/wirble/lib/wirble"
  Wirble.init
  Wirble.colorize
rescue LoadError
  # Don't worry about it...
end
