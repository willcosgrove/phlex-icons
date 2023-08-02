require 'rails/generators'

module Phlex
  module Icons
    class LibraryGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      def create_library_directory
        empty_directory "vendor/icons/#{file_name}"
      end

      def create_initializer_file
        initializer_path = 'config/initializers/phlex_icons.rb'
        unless File.exist?(::Rails.root.join(initializer_path))
          create_file initializer_path, "# Initializer for Phlex Icons\n\n"
        end
      end

      def append_library_to_initializer
        append_to_file 'config/initializers/phlex_icons.rb', library_code
      end

      private

      def library_code
        "Phlex::Icons.register_library(:#{file_name}, Rails.root.join('vendor', 'icons', '#{file_name}'))\n"
      end
    end
  end
end
