class Object  
  # Clone fails on numbers, but they're immutable anyway
  def mega_clone
    clone rescue self
  end
end

require 'stringio'
class MethodFinder
  def initialize(obj, *args)
    @obj, @args = obj, args
  end
  def ==(val)
    MethodFinder.show(@obj, val, *@args)
  end
  # Find all methods on [anObject] which, when called with [args] return [expectedResult]
  def self.find(an_object, expected_result, *args)
    an_object.methods.select { |name|
      an_object.method(name).arity == args.size
    }.select { |name|
      begin
        an_object.mega_clone.method(name).call(*args) == expected_result
      rescue
      end
    }
  end
  # Pretty-prints the results of the previous method
  def self.show(an_object, expected_result, *args)
    $old_stderr, $stderr = $stderr, StringIO.new
    methods = find(an_object, expected_result, *args).each do |name|
      print "#{an_object.inspect}.#{name}" 
      print "(" + args.map { |o| o.inspect }.join(", ") + ")" unless args.empty?
      puts  " == #{expected_result.inspect}" 
    end
    $stderr = $old_stderr
    methods
  end
end

class Object
  def what?(*a)
    MethodFinder.show(self, *a)
  end
end
