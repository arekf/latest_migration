$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "latest_migration/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "latest_migration"
  s.version     = LatestMigration::VERSION
  s.authors     = ["Arkadiusz Fal"]
  s.email       = ["arek@arekf.net"]
  s.homepage    = "https://github.com/arekf/latest_migration"
  s.summary     = "Rake task to open latest migration file in text editor"
  s.description = "Provides command to open latest migration file in text editor" \
                  "or just display latest migration file path in the standard output."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.required_ruby_version = ">= 2.0.0"
  s.add_dependency "rails", ">= 3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "codeclimate-test-reporter"
end
