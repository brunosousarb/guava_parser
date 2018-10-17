require 'parslet'
require 'parslet/accelerator'

module GuavaParser
  class GuavaTokenizer < Parslet::Parser
    rule(:space) { str(' ') }
    
    rule(:space?) { space.maybe }
    
    rule(:newline) { str('\n') }

    rule(:whitespace) { space.repeat }

    rule(:null) { str('null').as(:null) }

    rule(:emptyArray) { str('[]').as(:list) }

    rule(:array) { 
        (
            str('[') >> structure >> (str(',') >> space >> structure).repeat >> str(']')
        ).as(:list)
    }

    rule(:safe_string) { (match('[\=}\,]').absent? >> any).repeat }

    rule(:string) {         
        safe_string >> (
                str(',') >> space? >>  (
                        (key >> str('=') ).absent? >> safe_string
                )
            ).repeat
    }

    rule(:value) { null | emptyArray | array | structure |  string }
    
    rule(:key) { ( match('[\=\{\}\,\s\n]').absent? >> any).repeat(1) }


    rule(:assignment) { space? >> key.as(:key) >> str('=') >> value.as(:value) }

    rule(:structure) { (key.maybe >> str('{') >> (assignment >> ( str(',') >> assignment ).repeat).maybe >> space? >> str('}') >> space? ).as(:structure) }

    root(:structure)
  end
end