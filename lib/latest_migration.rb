module LatestMigration
  require "latest_migration/base"
  require "latest_migration/errors"
  require "latest_migration/railtie" if defined?(Rails) or fail LatestMigration::Errors::RailsNotFound
end
