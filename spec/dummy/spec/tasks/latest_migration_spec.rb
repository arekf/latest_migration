require "rails_helper"
require "../../lib/latest_migration"

RSpec.describe LatestMigration::Base do
  it "opens latest migration file in text editor" do
    expect(described_class).to receive("system").with(described_class.send(:editor_command))
    expect(STDOUT).to receive("puts").with("Opening 20151101184727_create_tags.rb")
    described_class.open_latest_migration
  end

  it "returns latest migration path" do
    expect(described_class.latest_migration_path).to include("20151101184727_create_tags.rb")
  end

  it "allows to override editor" do
    # editor gets overrided in the initializer, see:
    # spec/dummy/config/initializers/latest_migration.rb
    expect(described_class.editor).to eq :mine
  end

  context "private interface" do
    # it's not a greatest thing in the world to test private interface,
    # but the gem is so small it's not a rocket science
    # we use send to call private class methods
    it "returns migrations directory" do
      expect(described_class.send(:migrations_dir_path).to_s).to include("/latest_migration/spec/dummy/db/migrate")
    end

    it "returns migrations filename pattern" do
      expect(
          described_class.send(:migrations_filename_pattern)
      ).to include("/latest_migration/spec/dummy/db/migrate/*.rb")
    end

    it "returns migrations filenames" do
      expect(
        described_class.send(:migrations_filenames).map do |filename|
          File.join(filename.split("/").last(5))
        end
      ).to match_array %w(
        spec/dummy/db/migrate/20151101184705_create_posts.rb
        spec/dummy/db/migrate/20151101184714_create_categories.rb
        spec/dummy/db/migrate/20151101184727_create_tags.rb
      )
    end

    it "returns editor command" do
      command = described_class.send(:editor_command)
      expect(command).to include("mine")
      expect(command).to include("20151101184727_create_tags.rb")
    end

    it "returns latest migration filename" do
      expect(described_class.send(:latest_migration_filename)).to eq "20151101184727_create_tags.rb"
    end
  end
end