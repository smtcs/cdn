module CDN
  module School
    def self.included(app)
      app.get '/cs/hq.js' do
        Analytics.track(user_id: request.ip, event: 'Hit hashquery')
        serve 'hashquery', 'hq.js'
      end
    end
  end
end
