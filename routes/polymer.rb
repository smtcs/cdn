module CDN
  module Polymer
    def self.included(app)
      # Polymer
      app.get '/pl/pl.html', '/pl/polymer/polymer.html', '/polymer/polymer/polymer.html' do
        Analytics.track(user_id: request.ip, event: 'Hit polymer core lib')
        serve 'polymer', 'polymer.html'
      end

      # Web component polyfill
      app.get '/pl/wc.js' do
        Analytics.track(user_id: request.ip, event: 'Hit web component polyfill')
        serve 'polymer', 'webcomponents.js'
      end

      # Polymer layout (for polymer.html)
      app.get '/pl/layout.html', '/pl/polymer/layout.html' do
        serve 'polymer', 'layout.html'
      end

      # Polymer js (for polymer.html)
      app.get '/pl/polymer.js', '/pl/polymer/polymer.js' do
        serve 'polymer', 'polymer.js'
      end

      Dir['./libs/polymer/**/*'].each do |file|
        app.get file[6..file.length] do
          mime = nil
          case file.split('.').last
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
          File.read(File.join(file[2..file.length]))
        end
      end
    end
  end
end
