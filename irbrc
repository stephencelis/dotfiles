require 'irb/completion'
require 'rubygems'

begin
  $: << "#{ENV['HOME']}/.irb"

  # To require all libraries from ~/.irb
  def require_all
    Dir["#{ENV['HOME']}/.irb/*.rb"].map do |path|
      basename = "#{path.scan(%r{([^/]*).rb$})}"
      { basename => require(basename) }
    end
  end

  # Manifest
  require 'interactive_editor'
  require 'method_finder'
  unless RUBY_VERSION[/^1.9/]
    require 'wirble'
    Wirble.init
    Wirble.colorize
  end
rescue LoadError
end

begin
  load "#{ENV['HOME']}/.railsrc" if ENV['RAILS_ENV']
rescue LoadError
end
