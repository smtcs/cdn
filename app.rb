require 'sinatra/base'
require 'sinatra/multi_route'
require 'segment/analytics'

# Routes
require './routes/small'
require './routes/photoswipe'
require './routes/cssframeworks'
require './routes/polymer'

Analytics = Segment::Analytics.new({
  write_key: 'VOkH1POOQZ2csVKeZ2fLKjETIRFHD0Eo',
  on_error: Proc.new { |status, msg| print msg }
})
module CDN
  class Main < Sinatra::Base
    register Sinatra::MultiRoute

    # Include route block
    include CDN::SmallRoutes
    include CDN::PhotoSwipe
    include CDN::CSSFramework
    include CDN::Polymer

    set :static_cache_control, [:public, max_age: 60 * 60 * 24 * 7]

    helpers do
      # Serve function
      # defines mime type and outputs file
      def serve(abbr, filename)
        case filename.split('.').last
        when "js"
          mime = "application/ecmascript"
        when "css"
          mime = "text/css"
        when "svg"
          mime = "image/svg+xml"
        when "eot"
          mime = "application/vnd.ms-fontobject"
        when "ttf"
          mime = "application/octet-stream"
        when "woff"
          mime = "application/x-woff"
        when "gif"
          mime = "image/gif"
        end

        headers "Content-Type" => mime
        File.read(File.join('libs', abbr.to_s, filename.to_s))
      end
    end

    before do
      # Headers allow loading from other sites
      headers \
        "Access-Control-Allow-Origin" => "*",
        "Access-Control-Allow-Headers" => "Origin, X-Requested-With, Content-Type, Accept"
    end

    # Run if app file is called directly
    run! if app_file == $0
  end
end
