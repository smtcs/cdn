source "https://rubygems.org"

gem 'sinatra', '~> 1.4.3'
gem 'sinatra-contrib', '~> 1.4.2'
gem 'analytics-ruby', '~> 2.0.12', :require => 'segment/analytics'
gem 'bugsnag', '~> 2.8.1'
gem 'prometheus-client'

group :test, :production do
  gem 'passenger', '~> 5.0.0.rc2'
  gem 'rake', '~> 10.4.2'
  gem 'rspec', '~> 3.2.0'
  gem 'syntax', '~> 1.2.0'
  gem 'capybara', '~> 2.4.0'
  gem 'poltergeist', '~> 1.6.0'
  gem 'codeclimate-test-reporter', '~> 0.4.6', require: nil
end
