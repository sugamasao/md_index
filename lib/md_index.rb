require 'md_index/version'
require 'md_index/parser'

module MdIndex
  def self.run(file)
    begin
      raise ArgumentError.new("file(#{file}) is not found") if file.nil? || !File.file?(file)
      Parser.new(file).parse
    rescue => e
      warn e.message
      exit false
    end
  end
end

