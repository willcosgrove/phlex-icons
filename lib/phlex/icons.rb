require "phlex/icons/version"
require "phlex/icons/library"
require "phlex/icons/icon"
require "phlex/icons/helper"
require "phlex/icons/railtie" if defined?(Rails)

module Phlex
  module Icons
    class Error < StandardError; end

    @@libraries = {}

    def self.register_library(name, path)
      @@libraries[name] = Library.new(path)
    end

    def self.fetch(name, library:)
      @@libraries[library][name]
    end

    def self.clear_cache
      @@libraries.each_value(&:clear)
    end
  end
end
