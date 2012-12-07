source 'https://rubygems.org'

gem 'rails', '3.2.9'
#gem 'bootstrap-sass', '2.1'
gem "bcrypt-ruby"
gem 'faker', '1.0.1'

#gem 'gravatar-ultimate'



# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

#group :development, :test do
gem "rspec-rails"
#end

group :test do
gem "factory_girl_rails", ">= 1.6.0"
gem "cucumber-rails", ">= 1.2.1"
gem "database_cleaner"
gem "launchy"
gem "capybara"
gem 'shoulda-matchers'
end

# for deployment on Heroku
gem "heroku"
group :development, :test do
  gem 'sqlite3'
  gem "rspec-rails"
end
group :production do
  gem 'pg'
  gem 'thin'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
