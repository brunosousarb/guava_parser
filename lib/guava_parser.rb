require 'guava_parser/guava_tokenizer'
require 'guava_parser/guava_tokenizer_transform'

module GuavaParser
  
  def self.parse(data)
    transformer.apply( tokenizer.parse(data) )
  end

  private

  def self.tokenizer
    @tokenizer ||= GuavaTokenizer.new
    @tokenizer
  end

  def self.transformer
    @transform ||= GuavaTokenizerTransform.new
    @transform
  end

end