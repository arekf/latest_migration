[<img src="https://travis-ci.org/arekf/latest_migration.svg?branch=master" alt="Build Status" />](https://travis-ci.org/arekf/latest_migration) [<img src="https://codeclimate.com/github/arekf/latest_migration/badges/gpa.svg" />](https://codeclimate.com/github/arekf/latest_migration) [<img src="https://codeclimate.com/github/arekf/latest_migration/badges/coverage.svg" />](https://codeclimate.com/github/arekf/latest_migration) [<img src="https://badge.fury.io/rb/latest_migration.svg" alt="Gem Version" />](http://badge.fury.io/rb/latest_migration)

# latest_migration

`latest_migration` is a Ruby on Rails gem that allows you to open your latest
migration file in text editor. It saves the time of selecting, copying 
and opening the file in your editor.

## Installation
*   Add `latest_migration` to your Gemfile:
```ruby
gem 'latest_migration', group: development
```

* Install with: bundle install


## Usage
When installed, you have available two new Rake tasks:
```
rake latest_migration:open
rake latest_migration:path
```
The first one opens the latest migration in the text editor.

By default it uses `subl` command to open the file. You can override this with initializer:
```ruby
# config/initializers/latest_migration.rb
LatestMigration::Base.editor = :mine
```

You can use pass any command name you wish (like `:mine`, `:nano` etc.).

The second command just prints the filename of latest migration to standard output, like:
```
/Users/Arek/Workspace/myapp/db/migrate/20151101184727_create_tags.rb
```

## License
`latest_migration` is released under the MIT license:
*   http://www.opensource.org/licenses/MIT


## Author
Arkadiusz Fal
*   http://arekf.net


Copyright © 2015 Arkadiusz Fal
