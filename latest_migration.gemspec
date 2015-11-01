$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "latest_migration/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "latest_migration"
  s.version     = LatestMigration::VERSION
  s.authors     = ["Arkadiusz Fal"]
  s.email       = ["arek@arekf.net"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of LatestMigration."
  s.description = "TODO: Description of LatestMigration."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
end
