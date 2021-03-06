module CDN
  module CSS
    def self.included(app)
      # Bootstrap (with v2.3.2)
      app.get '/bs/bs.:ext' do
        if params[:v] == nil
          params[:v] = '3.3.1'
        end
        Analytics.track(
          user_id: request.ip,
          event: "Hit bootstrap #{params[:ext]} v#{params[:v]}",
          properties: {
            ext: params[:ext],
            version: params[:v]
        })
        serve "bootstrap/#{params[:v]}", "bootstrap.#{params[:ext]}"
      end

      # Bootstrap theme for 3.3.1
      app.get '/bs/theme.css' do
        Analytics.track(user_id: request.ip, event: 'Hit bootstrap theme css')
        serve 'bootstrap/3.3.1', 'bootstrap-theme.css'
      end

      # Bootstrap Icon font
      app.get '/bs/fonts/glyphicons-halflings-regular.:ext' do
        Analytics.track(user_id: request.ip, event: 'Hit bootstrap font')
        serve 'bootstrap/fonts', "glyphicons-halflings-regular.#{params[:ext]}"
      end

      # Material Design
      app.get '/md/md.:ext' do
        exttrack(request.ip, "Hit materialize #{params[:ext]}", params[:ext])
        serve 'materialize', "materialize.#{params[:ext]}"
      end

      # Material Design icon font
      app.get '/md/font/mdi/Material-Design-Icons.:ext' do
        Analytics.track(user_id: request.ip, event: 'Hit materialize icons')
        serve 'materialize/font/mdi', "Material-Design-Icons.#{params[:ext]}"
      end

      # Material Design font
      app.get '/md/font/roboto/Roboto-:density.ttf' do
        Analytics.track(user_id: request.ip, event: 'Hit materialize font')
        serve 'materialize/font/roboto', "Roboto-#{params[:density]}.ttf"
      end
    end
  end
end
