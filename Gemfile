source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# jquery lib
gem 'jquery-rails'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# figro gem is file config utility
gem "figaro"
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# devise is gem that handles authenticatation
gem 'devise'
# cancancan is gem that handles authorization
gem 'cancancan'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# default will_paginate gem
gem 'will_paginate'
# bootstrap 4 style will_paginate gem
gem 'will_paginate-bootstrap4'
# gem for showing a modal in bootstrap when deleting
gem 'data-confirm-modal'
# stripe payment gateway
gem 'stripe'
# brakeman security checker
gem 'brakeman', '~> 4.1', '>= 4.1.1'
# recaptcha gem to generate cptcha
gem "recaptcha", require: "recaptcha/rails"
# dalli is used by memcachier for automatic caching in heroku
gem 'dalli'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # rspec gem is for bdd testing approach
  gem 'rspec-rails', '~> 3.7'
  gem 'rails-controller-testing'
  gem "factory_bot_rails", "~> 4.0"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
