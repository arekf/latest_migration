module LatestMigration
  require "latest_migration/railtie" if defined?(Rails)
  require "latest_migration/base"
  require "latest_migration/errors"
end
