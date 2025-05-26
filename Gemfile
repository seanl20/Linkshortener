source "https://rubygems.org"

gem "bootsnap", require: false # Reduces boot times through caching; required in config/boot.rb
gem "importmap-rails" # Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "jbuilder" # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "kamal", require: false # Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "propshaft" # The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "puma", ">= 5.0" # Use the Puma web server [https://github.com/puma/puma]
gem "rails", "~> 8.0.2" # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "sqlite3", ">= 2.1" # Use sqlite3 as the database for Active Record
gem "stimulus-rails" # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "thruster", require: false # Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "turbo-rails" # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "tzinfo-data", platforms: %i[ windows jruby ] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "brakeman", require: false # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude" # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-rails"
  gem "rubocop-rails-omakase", require: false # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rspec-rails"
  gem "simplecov", require: false
end

group :development do
  gem "web-console" # Use console on exceptions pages [https://github.com/rails/web-console]
end

group :test do
  gem "shoulda-matchers"
end
