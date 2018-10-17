Gem::Specification.new do |s|
  s.name        = 'guava_parser'
  s.version     = '0.0.1'
  s.date        = '2017-05-26'
  s.summary     = "Guava parser"
  s.description = "Guava parser"
  s.authors     = ["Space Invaders"]
  s.email       = 'space.invaders@blip.pt'
  s.files       = ["lib/guava_parser.rb", "lib/guava_parser/guava_tokenizer.rb", "lib/guava_parser/guava_tokenizer_transform.rb"]
  #s.homepage    = 'http://rubygems.org/gems/hola'
  s.license     = 'MIT'
  s.add_dependency 'parslet', '1.7.1'
end
