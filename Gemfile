source 'http://rubygems.org'

gem 'rails', '3.1.3'
#gem 'rmagick', '2.12.0'
gem 'mini_magick'
gem 'carrierwave'
gem 'carrierwave-meta'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'
group :development do
  gem 'nifty-generators'
end

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'mysql2'
end

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.5"
  gem 'coffee-rails', "~> 3.1.1"
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
gem "mocha", :group => :test
