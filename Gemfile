source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'
# gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'carrierwave', '~> 1.1.0'
gem 'mini_magick', '~> 4.8'
gem 'fog-google'
gem 'google-api-client', '> 0.8.5', '< 0.9'
gem 'mime-types'
gem 'draper', '3.0.0'
gem 'ffaker', '~> 2.2'
gem 'haml', '~> 5.0', '>= 5.0.2'
gem 'haml-rails', '~> 1.0'
# gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.21.0'
# Use Puma as the app server
gem 'puma', '~> 3.9', '>= 3.9.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0', '>= 5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2', '>= 4.2.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :test do

  gem 'rspec-rails', '~> 3.6'

  gem 'capybara', '~> 2.15', '>= 2.15.1'

  gem 'database_cleaner', '~> 1.6', '>= 1.6.1'

  gem 'selenium-webdriver', '~> 3.4', '>= 3.4.4'

end

group :development, :test do
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
  gem 'rubocop', '~> 0.49.1'
  gem 'rubocop-rspec', '~> 1.15', '>= 1.15.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
