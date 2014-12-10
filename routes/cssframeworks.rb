module CDN
  module CSSFramework
    def self.included(base)
      # Bootstrap (with v2.3.2)
      base.get '/bs/bs.:ext' do
        if params[:v] == nil
          params[:v] = "3.3.1"
        end
        Analytics.track(
          user_id: request.ip,
          event: "Hit bootstrap #{params[:ext]} v#{params[:v]}",
          properties: {
            ext: params[:ext],
            version: params[:v]
        })
        serve "bs/#{params[:v]}", "bootstrap.#{params[:ext]}"
      end

      # Bootstrap theme for 3.3.1
      base.get '/bs/theme.css' do
        Analytics.track(user_id: request.ip, event: "Hit bootstrap theme css")
        serve 'bs/3.3.1', 'bootstrap-theme.css'
      end

      # Bootstrap Icon font
      base.get '/bs/fonts/glyphicons-halflings-regular.:ext' do
        Analytics.track(user_id: request.ip, event: "Hit bootstrap font")
        serve 'bs/fonts', "glyphicons-halflings-regular.#{params[:ext]}"
      end

      # Material Design
      base.get '/md/md.:ext' do
        Analytics.track(
          user_id: request.ip,
          event: "Hit materialize #{params[:ext]}",
          properties: {
            ext: params[:ext]
        })
        serve 'md', "materialize.#{params[:ext]}"
      end

      # Material Design icon font
      base.get '/md/font/mdi/Material-Design-Icons.:ext' do
        Analytics.track(user_id: request.ip, event: "Hit materialize icons")
        serve 'md/font/mdi', "Material-Design-Icons.#{params[:ext]}"
      end

      # Material Design font
      base.get '/md/font/roboto/Roboto-:density.ttf' do
        Analytics.track(user_id: request.ip, event: "Hit materialize font")
        serve '/md/font/roboto', "Roboto-#{params[:density]}.ttf"
      end
    end
  end
end
