module LatestMigration
  class Base
    class << self
      def open_latest_migration
        puts "Opening #{latest_migration_filename}"
        system editor_command
      rescue LatestMigration::Errors::MigrationsNotFoundError => e
        puts e
      end

      def latest_migration_path
        filename = latest_migration_filename
        File.join(Rails.root, filename)
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
        filename = ActiveRecord::Migrator.migrations(ActiveRecord::Migrator.migrations_path).last.try(:filename)
        filename or fail LatestMigration::Errors::MigrationsNotFoundError
      end
    end
  end
end