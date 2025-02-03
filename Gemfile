source "https://rubygems.org"

# Rails framework
gem "rails", "~> 8.0.0"
# Modern asset pipeline for Rails
gem "propshaft"
# Use PostgreSQL as the database for Active Record
gem "pg", "~> 1.1"
# Puma web server
gem "puma", ">= 5.0"
# JavaScript with ESM import maps
gem "importmap-rails"
# Hotwire SPA components
gem "turbo-rails"
gem "stimulus-rails"
# Build JSON APIs with ease
gem "jbuilder"
# to generate fake rides
gem 'faker', '~> 2.20'
# TailwindCSS setup and utilities
gem "tailwindcss-rails", "~> 4.0"
gem "autoprefixer-rails"

# Devise for user authentication
gem "devise"

# Utility gems for forms and icons
gem "font-awesome-sass", "~> 6.1"
gem "simple_form", github: "heartcombo/simple_form"
gem "sassc-rails"

# Caching, job queues, and action cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Optimize boot time
gem "bootsnap", require: false

# Deploy anywhere with Docker
gem "kamal", require: false

# HTTP asset caching and compression
gem "thruster", require: false

# Environment variables
gem "dotenv-rails", groups: [:development, :test]

# Development and debugging tools
group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

# Windows does not include zoneinfo files
gem "tzinfo-data", platforms: %i[windows jruby]