namespace :latest_migration do
  desc "Opens latest database migration file in the text editor"
  task open: :environment do
    LatestMigration::Base.open_latest_migration
  end

  desc "Prints latest database migration file path to the standard output"
  task :path do
    puts LatestMigration::Base.latest_migration_path
  end
end
