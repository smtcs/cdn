require 'net/http'
require 'rspec/core/rake_task'

task :default => 'test:pretty'

def download(file_name, url)
  link = "https://raw.githubusercontent.com/#{url}"
  File.write("./libs/#{file_name}", Net::HTTP.get(URI.parse(link)))
  puts "Downloaded #{file_name} from #{link}"
end

def direct(file_name, url)
  File.write("./libs/#{file_name}", Net::HTTP.get(URI.parse(url)))
  puts "Downloaded #{file_name} from #{url}"
end

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

desc 'Download all libraries'
task :libs => ['libs:css', 'libs:misc', 'libs:photoswipe', 'libs:school']

namespace :libs do
  desc 'Run all css tasks'
  task :css => 'css:all'

  namespace :css do
    desc 'Download all the bootstrap files from source'
    task :bootsrap do
      download 'bootstrap/3.3.1/bootstrap.css', 'twbs/bootstrap/master/dist/css/bootstrap.css'
      download 'bootstrap/3.3.1/bootstrap-theme.css', 'twbs/bootstrap/master/dist/css/bootstrap-theme.css'
      download 'bootstrap/3.3.1/bootstrap.js', 'twbs/bootstrap/master/dist/js/bootstrap.js'
    end

    desc 'Download all the materialize files'
    task :materialize do
      download 'materialize/materialize.css', 'Dogfalo/materialize/master/dist/css/materialize.css'
      download 'materialize/materialize.js', 'Dogfalo/materialize/master/dist/js/materialize.js'
    end

    task :all => [:bootsrap, :materialize]
  end

  desc 'Run all misc tasks'
  task :misc => 'misc:all'

  namespace :misc do
    desc 'Download all the jquery files'
    task :jquery do
      direct 'jquery/jquery-1.js', 'http://code.jquery.com/jquery-1.11.2.js'
      direct 'jquery/jquery-2.js', 'http://code.jquery.com/jquery-2.1.3.js'
    end

    desc 'Download all the font awesome files'
    task :fontawesome do
      download 'fontawesome/fa.css', 'FortAwesome/Font-Awesome/master/css/font-awesome.css'
      download 'fontawesome/fonts/FontAwesome.otf', 'FortAwesome/Font-Awesome/master/fonts/FontAwesome.otf'
      exts = %w[eot svg ttf woff]
      exts.each do |ext|
        download "fontawesome/fonts/fontawesome-webfont.#{ext}", "FortAwesome/Font-Awesome/master/fonts/fontawesome-webfont.#{ext}"
      end
    end

    desc 'Download skeleton lib'
    task :skeleton do
      download 'skeleton.css', 'dhg/Skeleton/master/css/skeleton.css'
      download 'normalize.css', 'dhg/Skeleton/master/css/normalize.css'
    end

    desc 'Download simple.css lib'
    task :simple do
      download 'simple.css', 'neculaesei/simplecss/master/src/simple.css'
    end

    task :all => [:jquery, :fontawesome, :skeleton, :simple]
  end

  desc 'Download all the photoswipe files'
  task :photoswipe do
    download 'photoswipe/photoswipe.js', 'dimsemenov/PhotoSwipe/master/dist/photoswipe.js'
    download 'photoswipe/photoswipe.css', 'dimsemenov/PhotoSwipe/master/dist/photoswipe.css'
    download 'photoswipe/photoswipe-ui-default.js', 'dimsemenov/PhotoSwipe/master/dist/photoswipe-ui-default.js'
    exts = %w[css png svg]
    exts.each do |ext|
      download "photoswipe/skin/default-skin.#{ext}", "dimsemenov/PhotoSwipe/master/dist/default-skin/default-skin.#{ext}"
    end
    download 'photoswipe/skin/preloader.gif', 'dimsemenov/PhotoSwipe/master/dist/default-skin/preload.gif'
  end

  desc 'Download all the school files'
  task :school => 'school:all'

  namespace :school do
    desc 'Download the hashquery lib from source'
    task :hash do
      download 'hashquery/hq.js', 'zucchinize/hashquery/master/dist/hash.min.js'
    end

    task :all => [:hash]
  end
end
