module CDN
  module Misc
    def self.included(app)
      # Homepage
      app.get '/' do
        Analytics.track(user_id: request.ip, event: 'Hit Homepage')
        erb :index
      end

      app.get '/old' do
        Analytics.track(user_id: request.ip, event: 'Hit old Homepage')
        erb :old
      end

      app.get '/test' do
        Analytics.track(user_id: request.ip, event: 'Hit tests')
        erb :test
      end

      # Jquery
      app.get '/jq/:num.js' do
        Analytics.track(
          user_id: request.ip,
          event: "Hit jQuery v#{params[:num]}",
          properties: {
            url: request.path_info,
            verison: params[:num]
        })
        serve 'jquery', "jquery-#{params[:num]}.js"
      end

      # Font Awesome
      app.get '/fa/fa.css' do
        Analytics.track(
          user_id: request.ip,
          event: 'Hit fontawesome',
          properties: {
            verison: "4.2.0"
        })
        serve 'fontawesome', 'fa.css'
      end

      # Font Awesome Font
      app.get '/fa/fonts/fontawesome-webfont.:ext' do
        Analytics.track(
          user_id: request.ip,
          event: "Hit fontwesome font",
          properties: {
            ext: params[:ext],
            verison: params[:num]
        })
        serve 'fontawesome/fonts', "fontawesome-webfont.#{params[:ext]}"
      end

      # Highlight JS
      app.get '/hl/hl.js' do
        Analytics.track(user_id: request.ip, event: 'Hit Highlight.js')
        serve 'hljs', 'highlight.pack.js'
      end

      # Highlight JS Theme
      app.get '/hl/:name.css' do
        Analytics.track(
          user_id: request.ip,
          event: "Hit hljs theme #{params[:name]}",
          properties: {
            name: params[:name]
        })
        serve 'hljs/styles', "#{params[:name]}.css"
      end

      # Skeleton css
      app.get '/sk.css' do
        Analytics.track(user_id: request.ip, event: 'Hit skeleton css')
        serve '.', 'skeleton.css'
      end

      # Normalize css
      app.get '/nl.css' do
        Analytics.track(user_id: request.ip, event: 'Hit normalize.css')
        serve '.', 'normalize.css'
      end

      # Simple.css
      app.get '/sm.css' do
        Analytics.track(user_id: request.ip, event: 'Hit simple.css')
        serve '.', 'simple.css'
      end
    end
  end
end
