ENV['RACK_ENV'] = 'test'
require_relative '../app'
require 'rspec'
require 'coveralls'
require 'capybara/rspec'
require 'capybara/poltergeist'

Coveralls.wear!

Capybara.app = CDN::Main
Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
