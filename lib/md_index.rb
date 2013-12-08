require 'md_index/version'
require 'md_index/parser'

module MdIndex
  def self.run(file)
    begin
      raise ArgumentError.new("file(#{file}) not found") if file.nil? || !File.file?(file)
      Parser.new(file).parse
    rescue => e
      warn 'md_index Error.'
      warn e.message
      puts
      usage
      exit false
    end
  end

  def self.usage
    puts 'usage: md_index markdown-format-file-path'
    puts '       extract header level string.'
  end
end

