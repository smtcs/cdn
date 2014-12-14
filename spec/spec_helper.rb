ENV['RACK_ENV'] = 'test'
require_relative '../app'
require 'rspec'
require 'capybara/rspec'

Capybara.app = CDN::Main

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
