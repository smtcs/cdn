module CDN
  module SmallRoutes
    def self.included(base)
      # Homepage
      base.get '/' do
        Analytics.track(user_id: request.ip, event: 'Hit Homepage')
        erb :index
      end

      # Jquery
      base.get '/jq/:num.js' do
        Analytics.track(
          user_id: request.ip,
          event: "Hit jQuery v#{params[:num]}",
          properties: {
            url: request.path_info,
            verison: params[:num]
        })
        serve 'jq', "jquery-#{params[:num]}.js"
      end

      # Font Awesome
      base.get '/fa/fa.css' do
        Analytics.track(
          user_id: request.ip,
          event: "Hit fontawesome",
          properties: {
            verison: "4.2.0"
        })
        serve 'fa', 'fa.css'
      end

      # Font Awesome Font
      base.get '/fa/fonts/fontawesome-webfont.:ext' do
        Analytics.track(
          user_id: request.ip,
          event: "Hit fontwesome font",
          properties: {
            ext: params[:ext],
            verison: params[:num]
        })
        serve 'fa/fonts', "fontawesome-webfont.#{params[:ext]}"
      end

      # Highlight JS
      base.get '/hl/hl.js' do
        Analytics.track(user_id: request.ip, event: "Hit Highlight.js")
        serve 'hl', 'highlight.pack.js'
      end

      # Highlight JS Theme
      base.get '/hl/:name.css' do
        Analytics.track(
          user_id: request.ip,
          event: "Hit hljs theme #{params[:name]}",
          properties: {
            name: params[:name]
        })
        serve 'hl/styles', "#{params[:name]}.css"
      end

      # Skeleton css
      base.get '/sk.css' do
        Analytics.track(user_id: request.ip, event: "Hit skeleton css")
        serve '.', 'skeleton.css'
      end

      # Normalize css
      base.get '/nl.css' do
        Analytics.track(user_id: request.ip, event: "Hit normalize.css")
        serve '.', 'normalize.css'
      end
    end
  end
end
