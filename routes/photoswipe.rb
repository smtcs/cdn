module CDN
  module PhotoSwipe
    def self.included(app)
      # PhotoSwipe
      app.get '/ps/ps.:ext' do
        Analytics.track(
          user_id: request.ip,
          event: "Hit photoswipe #{params[:ext]}",
          properties: {
            ext: params[:ext]
        })
        serve 'ps', "photoswipe.#{params[:ext]}"
      end

      # Photoswipe UI
      app.get '/ps/ps-ui.js' do
        Analytics.track(user_id: request.ip, event: "Hit Photoswipe ui")
        serve 'ps', 'photoswipe-ui-default.js'
      end

      # Photoswipe Skin
      app.get '/ps/skin/skin.:ext' do
        Analytics.track(
          user_id: request.ip,
          event: "Hit photoswipe skin #{params[:ext]}",
          properties: {
            ext: params[:ext]
        })
        serve 'ps/skin', "default-skin.#{params[:ext]}"
      end

      # Photoswipe Skin preloader
      app.get '/ps/skin/preloader.gif' do
        Analytics.track(user_id: request.ip, event: "Hit photoswipe preloader")
        serve 'ps/skin', 'preloader.gif'
      end
    end
  end
end
