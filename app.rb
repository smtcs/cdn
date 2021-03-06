require 'sinatra/base'
require 'sinatra/multi_route'
require 'segment/analytics'
require 'bugsnag'

# Routes
require_relative 'routes/misc'
require_relative 'routes/photoswipe'
require_relative 'routes/css'
require_relative 'routes/polymer'
require_relative 'routes/school'

Analytics = Segment::Analytics.new({
  write_key: 'VOkH1POOQZ2csVKeZ2fLKjETIRFHD0Eo',
  on_error: Proc.new { |status, msg| print msg }
})

Bugsnag.configure do |config|
  config.api_key = "157fd483182ab0b53375a8ecd39fa4e2"
  config.project_root = `pwd`
end

module CDN
  class Main < Sinatra::Base
    register Sinatra::MultiRoute
    use Bugsnag::Rack
    enable :raise_errors

    # Start route block
    include CDN::Misc
    include CDN::PhotoSwipe
    include CDN::CSS
    include CDN::Polymer
    include CDN::School
    # End route block

    set :static_cache_control, [:public, max_age: 60 * 60 * 24 * 7]

    helpers do
      # Serve function
      # defines mime type and outputs file
      def serve(abbr, filename)
        mimetype filename
        File.read(File.join('libs', abbr.to_s, filename.to_s))
      end

      def mimetype(filename)
        mime = nil
        case filename.split('.').last
        when 'js'
          mime = 'application/ecmascript'
        when 'css'
          mime = 'text/css'
        when 'svg'
          mime = 'image/svg+xml'
        when 'eot'
          mime = 'application/vnd.ms-fontobject'
        when 'ttf'
          mime = 'application/octet-stream'
        when 'woff'
          mime = 'application/x-woff'
        when 'gif'
          mime = 'image/gif'
        end

        headers 'Content-Type' => mime
      end

      def exttrack(ip, event, ext)
        Analytics.track(
          user_id: ip,
          event: event,
          properties: {
            ext: ext
        })
      end
    end

    before do
      # Headers allow loading from other sites
      headers \
        'Access-Control-Allow-Origin' => '*',
        'Access-Control-Allow-Headers' => 'Origin, X-Requested-With, Content-Type, Accept'
    end

    not_found do
      status 404
      Bugsnag.notify(RuntimeError.new("404 Route not found"))
    end
  end
end
