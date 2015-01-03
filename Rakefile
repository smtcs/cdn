require 'net/http'
require 'rspec/core/rake_task'

def download(file_name, url)
  File.write("./libs/#{file_name}", Net::HTTP.get(URI.parse("https://raw.githubusercontent.com/#{url}")))
end

task :default => 'test:pretty'

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

namespace :libs do
  namespace :css do
    desc 'Download all the bootstrap files from source'
    task :bs do
      download 'bootstrap/3.3.1/bootstrap.css', 'twbs/bootstrap/master/dist/css/bootstrap.css'
      download 'bootstrap/3.3.1/bootstrap-theme.css', 'twbs/bootstrap/master/dist/css/bootstrap-theme.css'
      download 'bootstrap/3.3.1/bootstrap.js', 'twbs/bootstrap/master/dist/css/bootstrap.js'
    end
  end

  namespace :misc do

  end

  namespace :photoswipe do

  end

  namespace :polymer do

  end

  namespace :school do
    desc 'Download the hashquery lib from source'
    task :hash do
      download 'hashquery/hq.js', 'zucchinize/hashquery/master/dist/hash.min.js'
    end
  end
end
