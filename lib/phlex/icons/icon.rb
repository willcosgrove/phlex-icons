module Phlex
  module Icons
    class Icon < Phlex::HTML
      def initialize(name, library:, **svg_attributes)
        @content, @attribute_start, @svg_close = Phlex::Icons.fetch(name, library:)
        @svg_attributes = svg_attributes
        @title = @svg_attributes.delete(:title)
      end

      def template
        if @svg_attributes.any? || @title
          unsafe_raw @content[...@attribute_start]
          unsafe_raw rendered_svg_attributes
          if @title
            unsafe_raw @content[@attribute_start...@svg_close]
            title { @title }
            unsafe_raw @content[@svg_close...]
          else
            unsafe_raw @content[4...]
          end
        else
          unsafe_raw @content
        end
      end

      def rendered_svg_attributes
        Phlex::ATTRIBUTE_CACHE[@svg_attributes.hash] || __attributes__(**@svg_attributes)
      end
    end
  end
end
