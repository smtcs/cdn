require 'rspec/core/rake_task'

namespace :test do
  desc "Output pretty colorized tests"
  RSpec::Core::RakeTask.new(:pretty) do |t|
    t.rspec_opts = '--format documentation --color --tty'
  end

  desc "Output simple dot tests"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = '--color --tty'
  end

  desc "Output html page of tests"
  RSpec::Core::RakeTask.new(:html) do |t|
    t.rspec_opts = '--format html --out ./tests.html'
  end
end
