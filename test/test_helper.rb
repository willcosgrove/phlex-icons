ENV["RAILS_ENV"] = "test"

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "rails/test_help"
require "phlex/icons"
require "minitest/autorun"

require_relative "../test/dummy/config/environment"
# ActiveRecord::Migrator.migrations_paths = [File.expand_path("../test/dummy/db/migrate", __dir__)]
# ActiveRecord::Migrator.migrations_paths << File.expand_path("../db/migrate", __dir__)
