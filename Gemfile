source "https://rubygems.org"

ruby '2.1.4'

gem 'sinatra', '~> 1.4.3'
gem 'sinatra-contrib'
gem 'analytics-ruby', '~> 2.0.0', :require => 'segment/analytics'
gem 'coveralls', require: false

group :test, :production do
  gem 'passenger', '~> 5.0.0.beta1'
  gem 'rake'
  gem 'rspec', '~> 3.0.0'
  gem 'syntax'
  gem 'capybara', '~> 2.4.0'
  gem 'poltergeist'
end
