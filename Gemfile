source 'https://rubygems.org/'

gem 'rails', '5.0.0.1'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'listen'
gem 'devise'
gem 'rake'
group :development, :test do
  gem 'jasmine'
  gem 'capybara'
  gem "dotenv-rails"
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'pry-rails'
  gem 'shoulda'
  gem 'valid_attribute'
  gem 'better_errors'
end

group :test do
  gem 'launchy', require: false
  gem 'coveralls', require: false
  gem 'database_cleaner'
end

group :production do
  gem 'puma'
  gem 'rails_12factor'
end

group :development, :production do
  gem 'carrierwave', '~> 1.0'
end
