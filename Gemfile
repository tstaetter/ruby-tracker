# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'dotenv'
gem 'gruf', '~> 2.10'
gem 'mongoid', '~> 7.3.3'

group :development, :test do
end

group :test do
  gem 'factory_bot'
  gem 'gruf-rspec'
  gem 'mongoid-rspec', '~> 4.1.0'
  gem 'rspec'
  gem 'simplecov', require: false
end
