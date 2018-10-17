require 'parslet'

module GuavaParser
  class GuavaTokenizerTransform < Parslet::Transform
    rule(simple(:x)) {
      return nil if x.nil?
      x.to_s
    }
    rule({:structure => subtree(:attributions)}) {
      result = attributions || []
      result = [result] if result.is_a?(Hash)
      result.reduce({}, :merge)
    }
    rule({:structure => sequence(:attributions)}) {
      print attributions
      (attributions || []).reduce({}, :merge)
    }

    rule({:structure => simple(:x)}) {
      return nil if x.nil?
      {}
    }  
    rule({:key => simple(:x), :value => subtree(:y)}) {
      {x => y}
    }
    rule({:key => simple(:x), :value => simple(:y)}) {
      {x => y}
    }

    rule({:list => subtree(:elements)}) {
      elements
    }
    rule({:list => simple(:element)}) {
      return nil if element.nil?
      []
    }

    rule({:null => 'null'}) {
      nil
    }
  end
end