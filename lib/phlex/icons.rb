require "active_support"
require "phlex/icons/version"
require "phlex/icons/library"
require "phlex/icons/icon"
require "phlex/icons/helper"
require "phlex/icons/railtie" if defined?(Rails)

module Phlex
  module Icons
    class Error < StandardError; end

    class LibraryNotFound < Error; end

    class IconNotFound < Error; end

    @@libraries = {}

    mattr_accessor :cache
    @@cache = ActiveSupport::Cache::MemoryStore.new

    mattr_accessor :logger
    @@logger = ActiveSupport::Logger.new($stdout)

    def self.setup
      yield(self)
    end

    def self.cache_key_for(library)
      "phlex/icons/#{library}"
    end

    def self.register_library(name, path)
      @@libraries[name] = Library.new(path)
      @@cache.write(cache_key_for(name), @@libraries[name])
    end

    def self.fetch(name, library:, variant: nil)
      raise LibraryNotFound, "Library #{library} not found" unless @@libraries.key?(library)

      icon_name = [variant, name].compact.join("/")
      if (icon = @@cache.fetch(cache_key_for(library))[icon_name])
        icon
      else
        raise IconNotFound, "Icon '#{icon_name}.svg' not found in library #{library}" unless @@libraries[library][icon_name]
      end
    end

    def self.clear_cache
      @@libraries.each_value(&:clear)
    end
  end
end
