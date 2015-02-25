source "https://rubygems.org"

ruby '2.2.0'

gem 'sinatra', '~> 1.4.3'
gem 'sinatra-contrib'
gem 'analytics-ruby', '~> 2.0.12', :require => 'segment/analytics'
gem 'bugsnag', '~> 2.8.1'

group :test, :production do
  gem 'passenger', '~> 5.0.0.beta1'
  gem 'rake'
  gem 'rspec', '~> 3.2.0'
  gem 'syntax'
  gem 'capybara', '~> 2.4.0'
  gem 'poltergeist'
  gem 'codeclimate-test-reporter', '~> 0.4.6', require: nil
end
