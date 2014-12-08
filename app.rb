require 'sinatra'
require 'json'
require 'pony'

set :static_cache_control, [:public, max_age: 60 * 60 * 24 * 7]

helpers do
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
  headers \
    "Access-Control-Allow-Origin" => "*",
    "Access-Control-Allow-Headers" => "Origin, X-Requested-With, Content-Type, Accept"
end

get '/' do
  erb :index
end

post '/req' do
  puts params.to_json
  Pony.mail :to => "me@alexb.ninja",
            # :cc => "mhesby@summitps.org",
            :from => "cdn@smtcs.rocks",
            :subject => "#{params[:name]} Requested the #{params[:framework]}.",
            :body => erb(:email)
  erb :email_after
end

get '/jq/:num.js' do
  serve 'jq', "jquery-#{params[:num]}.js"
end

get '/fa/fa.css' do
  serve 'fa', 'fa.css'
end

get '/fa/fonts/fontawesome-webfont.:ext' do
  serve 'fa/fonts', "fontawesome-webfont.#{params[:ext]}"
end

get '/ps/ps.:ext' do
  serve 'ps', "photoswipe.#{params[:ext]}"
end

get '/ps/ps-ui.js' do
  serve 'ps', 'photoswipe-ui-default.js'
end

get '/ps/skin/skin.:ext' do
  serve 'ps/skin', "default-skin.#{params[:ext]}"
end

get '/ps/skin/preloader.gif' do
  serve 'ps/skin', 'preloader.gif'
end

get '/bs/bs.:ext' do
  if params[:v] == nil
    params[:v] = "3.3.1"
  end
  serve "bs/#{params[:v]}", "bootstrap.#{params[:ext]}"
end

get '/bs/theme.css' do
  serve 'bs', 'bootstrap-theme.css'
end

get '/bs/fonts/glyphicons-halflings-regular.:ext' do
  serve 'bs/fonts', "glyphicons-halflings-regular.#{params[:ext]}"
end

get '/md/md.:ext' do
  serve 'md', "materialize.#{params[:ext]}"
end

get '/md/font/mdi/Material-Design-Icons.:ext' do
  serve 'md/font/mdi', "Material-Design-Icons.#{params[:ext]}"
end

get '/md/font/roboto/Roboto-:density.ttf' do
  serve '/md/font/roboto', "Roboto-#{params[:density]}.ttf"
end
