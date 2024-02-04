# Initializer for Phlex Icons

Phlex::Icons.setup do |config|
  config.cache = ActiveSupport::Cache::MemoryStore.new
  config.logger = Rails.logger
end

Phlex::Icons.register_library(:heroicons, Rails.root.join("vendor", "icons", "heroicons"))
