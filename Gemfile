# frozen_string_literal: true
ruby '2.5.0'

source 'https://rubygems.org'

gem 'rake'

# Web framework
gem 'dry-system', '~> 0.9'
gem 'dry-web', '~> 0.7'
gem 'dry-web-roda', '~> 0.11'
gem 'puma'
gem 'rack_csrf'

gem 'rack', '>= 2.0'

# Database persistence
gem 'pg'
gem 'rom', '~> 4.0'
gem 'rom-sql', '~> 2.1'

# Application dependencies
gem 'dry-matcher', '~> 0.6.0'
gem 'dry-monads', '~> 0.3'
gem 'dry-struct', '~> 0.3'
gem 'dry-transaction', '~> 0.10'
gem 'dry-types', '~> 0.12'
gem 'dry-validation', '~> 0.11'
gem 'jsonapi-rb', '~> 0.5'
gem 'memoizable'
gem 'roda-symbolized_params'

group :development, :test do
  gem 'pry-byebug', platform: :mri
  gem 'rerun'
  gem 'rubocop'
end

group :test do
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'rom-factory', '~> 0.5'
  gem 'rspec'
end
