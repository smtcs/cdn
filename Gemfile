source "https://rubygems.org"

ruby '2.1.4'

gem 'sinatra', '~> 1.4.3'
gem 'sinatra-contrib'
gem 'analytics-ruby', '~> 2.0.0', :require => 'segment/analytics'
gem 'bugsnag', '~> 2.7.1'

group :test, :production do
  gem 'passenger', '~> 5.0.0.beta2'
  gem 'rake'
  gem 'rspec', '~> 3.1.0'
  gem 'syntax'
  gem 'capybara', '~> 2.4.0'
  gem 'poltergeist'
  gem 'codeclimate-test-reporter', '~> 0.4.4', require: nil
end
