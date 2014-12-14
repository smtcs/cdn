require 'rspec/core/rake_task'

task :default => :spec

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--format documentation --color --tty'
end

RSpec::Core::RakeTask.new(:html) do |t|
  t.rspec_opts = '--format html --out views/test.erb'
end
