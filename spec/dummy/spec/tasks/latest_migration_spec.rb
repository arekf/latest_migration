require_relative "../../../../spec/rails_helper"
require_relative "../../../../lib/latest_migration"

RSpec.describe LatestMigration::Base do
  it "opens latest migration file in text editor" do
    expect(described_class).to receive("system").with(described_class.send(:editor_command))
    expect(STDOUT).to receive("puts").with("Opening db/migrate/20151101184727_create_tags.rb")
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
end