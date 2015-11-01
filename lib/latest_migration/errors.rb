module LatestMigration
  # :nocov:
  module Errors
    class MigrationsNotFoundError < StandardError
      def message
        "Could not find any migration in this Rails application"
      end
    end

    class MigrationsDirNotFoundError < StandardError
      def message
        "Could not find migrations directory in this Rails application"
      end
    end

    class RailsNotFound < StandardError
      def message
        "Could not load Rails environment"
      end
    end
  end
  # :nocov:
end