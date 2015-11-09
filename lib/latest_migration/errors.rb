module LatestMigration
  module Errors
    class MigrationsNotFoundError < StandardError
      def initialize
        super("Could not find any migration in this Rails application")
      end
    end

    class RailsNotFound < StandardError
      def initialize
        super("Could not load Rails environment")
      end
    end
  end
end