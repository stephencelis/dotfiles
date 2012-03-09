autoload :Readline, 'readline'
require 'pp'

if IRB.const_defined?(:VERSION) # MacRuby, 1.9 with DietIRB...
  require 'irb/ext/completion'
  require 'irb/ext/history'

  require 'irb/ext/colorize'
  class IRB::ColoredFormatter
    def debug!
      def color(type)
        type = TYPE_ALIASES[type] if TYPE_ALIASES.has_key?(type)
        p type
        @colors[type]
      end
    end

    COLOR_SCHEMES[:stephencelis] = {
      # :prompt
      # :result_prefix

      # :comma
      # :operator

      # :open_hash
      # :close_hash
      # :open_array
      # :close_array

      :symbol_prefix      => :red,
      :symbol             => :red,

      :open_string        => :purple,
      :string             => :red,
      :close_string       => :purple,

      :number             => :red,
      :keyword            => :purple,
      :constant           => :green,

      :on_gvar            => :cyan,
      :on_cvar            => :cyan,
      :on_ivar            => :cyan
    }
  end

  IRB.formatter.color_scheme = :stephencelis
else # Other rubies.
  require 'irb/completion'
  require 'irb/ext/save-history'
end

version = %x{[[ -x `which rbenv` ]] && rbenv version-name}.chomp
version = '>' if version.empty?
IRB.conf[:PROMPT][:CUSTOM] = {
  :PROMPT_N => "#{version}> ",
  :PROMPT_I => "#{version}> ",
  :PROMPT_S => nil,
  :PROMPT_C => ' ?> ',
  :RETURN => " => %s\n"
}
IRB.conf[:PROMPT_MODE] = :CUSTOM
