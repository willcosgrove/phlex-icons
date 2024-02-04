module Phlex::Icons
  class Library
    def initialize(dir)
      @dir = dir
      @cache = {}
      load_svgs.each { |name| @cache[name] = load_icon(name) }
    end

    def [](name)
      @cache[name]
    end

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

    def load_svgs
      regex = %r{#{@dir}/(\S+).svg}
      Dir.glob(File.join(@dir, "/**/*.svg")).map do |path|
        path.scan(regex)
      end.flatten
    end
  end
end
