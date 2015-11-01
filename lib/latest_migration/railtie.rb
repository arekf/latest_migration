require "latest_migration"
require "rails"

module LatestMigration
  class Railtie < Rails::Railtie
    railtie_name :latest_migration

    rake_tasks do
      # :nocov:
      load "tasks/latest_migration_tasks.rake"
      # :nocov:
    end
  end
end