module LatestMigration
  class Base
    class << self
      def open_latest_migration
        puts "Opening #{latest_migration_filename}"
        system editor_command
      # :nocov:
      rescue LatestMigration::Errors::MigrationsNotFoundError
        puts "Could not find any migration in this Rails application"
      # :nocov:
      end

      def latest_migration_path
        File.join(
            Rails.root,
            (latest_migration_filename or fail LatestMigration::Errors::MigrationsNotFoundError)
        )
      end

      def editor
        @editor ||= :subl
      end

      attr_writer :editor

      private

      def editor_command
        "#{editor} #{latest_migration_path}"
      end

      def latest_migration_filename
        ActiveRecord::Migrator.migrations(ActiveRecord::Migrator.migrations_path).last.try(:filename)
      end
    end
  end
end