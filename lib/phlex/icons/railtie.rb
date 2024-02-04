require "generators/phlex/icons/library/library_generator"

module Phlex::Icons
  class Railtie < Rails::Railtie
    initializer "phlex-icons.clear_cache", before: :load_environment_hook do
      ActiveSupport::Reloader.to_prepare do
        Phlex::Icons.clear_cache
      end
    end
  end
end
