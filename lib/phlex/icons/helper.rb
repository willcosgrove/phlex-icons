module Phlex::Icons
  module Helper
    def self.[](default_library)
      Module.new do
        define_method :Icon do |name, library: default_library, **options|
          render Icon.new(name, library:, **options)
        end
        alias_method :icon, :Icon
      end.tap do |mod|
        mod.singleton_class.class_eval do
          define_method :inspect do
            "Phlex::Icons::Helper[#{default_library.inspect}]"
          end
          alias_method :to_s, :inspect
        end
      end
    end
  end
end
