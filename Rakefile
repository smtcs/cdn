require 'rspec/core/rake_task'

task :default => 'test:pretty'

namespace :test do
  RSpec::Core::RakeTask.new(:pretty) do |t|
    t.rspec_opts = '--format documentation --color --tty'
  end

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = '--color --tty'
  end

  RSpec::Core::RakeTask.new(:html) do |t|
    t.rspec_opts = '--format html --out ./tests.html'
  end
end
