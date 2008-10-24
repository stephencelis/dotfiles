require 'tempfile'
class InteractiveEditor
  attr_accessor :editor
  def initialize(editor = :vim)
    @editor = editor.to_s
    @editor += " -f" if @editor == "mvim"    
    @editor += " -w" if @editor == "mate"
  end
  def edit
    unless @file
      dir   = Tempfile.new("init")
      @file = File.new(dir.path + '.rb', 'w+')
    end
    system("#{@editor} #{@file.path}")
    execute
  end
  def execute
    @file.rewind
    Object.class_eval(@file.read)
  rescue Exception => error
    puts error
  end
end

def edit(editor)
  unless IRB.conf[:interactive_editors] && IRB.conf[:interactive_editors][editor]
    IRB.conf[:interactive_editors] ||= {}
    IRB.conf[:interactive_editors][editor] = InteractiveEditor.new(editor)
  end
  IRB.conf[:interactive_editors][editor].edit
end

def vi() edit(:vim) end
alias vim vi
def mvim() edit(:mvim) end
def mate() edit(:mate) end
def emacs() edit(:emacs) end
