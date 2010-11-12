if IRB.const_defined?(:VERSION) # MacRuby, 1.9 with DietIRB...
  require 'irb/ext/completion'
  require 'irb/ext/history'

  require 'irb/ext/colorize'
  class IRB::ColoredFormatter
    COLOR_SCHEMES[:stephencelis] = COLOR_SCHEMES[:dark_background].merge({
      # :prompt             => :green,
      # :result_prefix      => :light_purple,

      # :comma              => :blue,
      # :operator           => :blue,

      # :open_hash          => :green,
      # :close_hash         => :green,
      # :open_array         => :green,
      # :close_array        => :green,

      :symbol_prefix      => :brown, # :yellow, # hmm ident...
      :symbol             => :brown, # :yellow,

      # :open_string        => :red,
      # :string             => :cyan,
      # :close_string       => :red,

      # :number             => :cyan,
      # :keyword            => :brown,
      # :constant           => :light_green
    })
  end

  IRB.formatter.color_scheme = :stephencelis
else # Other rubies.
  require 'irb/completion'
  require 'irb/ext/save-history'
end
