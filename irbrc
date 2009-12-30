require 'irb/completion'
require "#{ENV["HOME"]}/.irb/interactive_editor"

# Ruby 1.9-compliant wirble (also doesn't auto-require "rubygems").
unless Object.const_defined? :MACRUBY_VERSION
  require "#{ENV["HOME"]}/.irb/wirble-0.1.2/wirble"
  Wirble.init
  Wirble.colorize
end

begin
  load "#{ENV['HOME']}/.railsrc" if ENV['RAILS_ENV']
rescue LoadError
end
