require "latest_migration"
require "rails"

module LatestMigration
  class Railtie < Rails::Railtie
    railtie_name :latest_migration

    rake_tasks do
      load "tasks/latest_migration_tasks.rake"
    end
  end
end