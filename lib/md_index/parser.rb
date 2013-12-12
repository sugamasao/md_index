module MdIndex
  class Parser
    def initialize(file)
      @lines = File.readlines file
    end

    def parse
      @lines.each do |line|

        @inner_pre_tag = !@inner_pre_tag if pre?(line)
        next if @inner_pre_tag

        title_object = title_line(line)
        if title_object
          output(title_object)
        end
      end
    end

    private

    def title_line(line)
      if line =~ /^(#+)(.+)$/
        {
            index_level: $1.length,
            title: $2
        }
      end
    end

    def pre?(line)
      return true if line =~ /^\`\`\`/
      true if line =~ %r!</?pre>!
    end

    def output(title)
      label = level2word(title[:index_level])
      print '  ' * title[:index_level]
      puts [label, title[:title]].join(' ')
    end

    def level2word(index_level)
      case index_level
        when 1
          '章'
        when 2
          '節'
        when 3
          '項'
        when 4
          '・'
        else
          '■'
      end
    end

  end
end
