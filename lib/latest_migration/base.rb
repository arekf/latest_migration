module LatestMigration
  class Base
    class << self
      def open_latest_migration
        puts "Opening #{latest_migration_filename}"
        system editor_command
      rescue LatestMigration::Errors::MigrationsNotFoundError
        puts "Could not find any migration in this Rails application"
      end

      def latest_migration_path
        migrations_filenames.sort.last or fail LatestMigration::Errors::MigrationsNotFoundError
      end

      def editor
        @editor ||= :subl
      end

      attr_writer :editor

      private

      def latest_migration_filename
        File.basename(latest_migration_path)
      end

      def editor_command
        "#{editor} #{latest_migration_path}"
      end

      def migrations_filenames
        Dir.glob(migrations_filename_pattern)
      end

      def migrations_filename_pattern
        File.join(migrations_dir_path, "*.rb")
      end

      def migrations_dir_path
        dir_path = Rails.root.join("db", "migrate") if defined?(Rails) or fail LatestMigration::Errors::RailsNotFound
        dir_path if Dir.exist?(dir_path) or fail LatestMigration::Errors::MigrationsDirNotFoundError
      end
    end
  end
end