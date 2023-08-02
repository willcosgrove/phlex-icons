module Phlex::Icons
  class Library
    def initialize(dir)
      @dir = dir
      @cache = Hash.new do |cache, name|
        cache[name] = load_icon(name)
      end
    end

    def [](name) = @cache[name]

    def clear
      @cache.clear
      self
    end

    private

    def load_icon(name)
      svg = File.read(File.join(@dir, "#{name}.svg"))
      attribute_start = svg.index("<svg") + 4
      svg_close = svg.index(">", attribute_start) + 1
      [svg, attribute_start, svg_close]
    end
  end
end
