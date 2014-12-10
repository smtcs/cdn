module CDN
  module Polymer
    def self.included(base)
      # Polymer
      base.get '/pl/pl.html', '/pl/polymer/polymer.html' do
        Analytics.track(user_id: request.ip, event: "Hit polymer core lib")
        serve 'pl', 'polymer.html'
      end

      # Web component polyfill
      base.get '/pl/wc.js' do
        Analytics.track(user_id: request.ip, event: "Hit web component polyfill")
        serve 'pl', 'webcomponents.js'
      end

      # Polymer layout (for polymer.html)
      base.get '/pl/layout.html', '/pl/polymer/layout.html' do
        serve 'pl', 'layout.html'
      end

      base.get '/pl/polymer/layout.html' do
        serve 'pl', 'layout.html'
      end

      # Polymer js (for polymer.html)
      base.get '/pl/polymer.js', '/pl/polymer/polymer.js' do
        serve 'pl', 'polymer.js'
      end

      # Polymer Paper element
      base.get '/pl/p/:elem.:ext', '/pl/paper-*/:elem.:ext' do
        Analytics.track(
          user_id: request.ip,
          event: "Hit polymer element #{params[:elem]} #{params[:ext].upcase}",
          properties: {
            name: params[:elem]
          }
        )
        if params[:elem].include? "-base"
          serve "pl/paper/#{params[:elem].chomp('-base')}", "#{params[:elem]}.#{params[:ext]}"
        elsif params[:elem].include? "-css"
          serve "pl/paper/#{params[:elem].chomp('-css')}", "#{params[:elem]}.#{params[:ext]}"
        elsif params[:ext] == "js"
          serve "pl/paper/paper-#{params[:splat][0]}", "#{params[:elem]}.#{params[:ext]}"
        else
          serve "pl/paper/#{params[:elem]}", "#{params[:elem]}.#{params[:ext]}"
        end
      end

      # Polymer Core element
      base.get '/pl/c/:elem.:ext', '/pl/core-*/:elem.:ext' do
        Analytics.track(
          user_id: request.ip,
          event: "Hit polymer element #{params[:elem]} #{params[:ext].upcase}",
          properties: {
            name: params[:elem]
          }
        )
        if params[:elem].include? "-base"
          serve "pl/core/#{params[:elem].chomp('-base')}", "#{params[:elem]}.#{params[:ext]}"
        elsif params[:elem].include? "-css"
          serve "pl/core/#{params[:elem].chomp('-css')}", "#{params[:elem]}.#{params[:ext]}"
        elsif params[:elem].include? "-key-helper"
          serve "pl/code/core-#{params[:splat][0]}", "#{params[:elem]}.#{params[:ext]}"
        elsif params[:ext] == "js"
          serve "pl/core/core-#{params[:splat][0]}", "#{params[:elem]}.#{params[:ext]}"
        else
          serve "pl/core/#{params[:elem]}", "#{params[:elem]}.#{params[:ext]}"
        end
      end
    end
  end
end
