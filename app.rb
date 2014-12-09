require 'sinatra'
require 'json'
require 'segment/analytics'

Analytics = Segment::Analytics.new({
  write_key: 'VOkH1POOQZ2csVKeZ2fLKjETIRFHD0Eo',
  on_error: Proc.new { |status, msg| print msg }
})

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
  Analytics.track(user_id: request.ip, event: 'Hit Homepage')
  erb :index
end

get '/jq/:num.js' do
  Analytics.track(
    user_id: request.ip,
    event: "Hit jQuery v#{params[:num]}",
    properties: {
      url: request.path_info,
      verison: params[:num]
  })
  serve 'jq', "jquery-#{params[:num]}.js"
end

get '/fa/fa.css' do
  Analytics.track(
    user_id: request.ip,
    event: "Hit fontawesome",
    properties: {
      verison: "4.2.0"
  })
  serve 'fa', 'fa.css'
end

get '/fa/fonts/fontawesome-webfont.:ext' do
  Analytics.track(
    user_id: request.ip,
    event: "Hit fontwesome font",
    properties: {
      ext: params[:ext],
      verison: params[:num]
  })
  serve 'fa/fonts', "fontawesome-webfont.#{params[:ext]}"
end

get '/ps/ps.:ext' do
  Analytics.track(
    user_id: request.ip,
    event: "Hit photoswipe #{params[:ext]}",
    properties: {
      ext: params[:ext]
  })
  serve 'ps', "photoswipe.#{params[:ext]}"
end

get '/ps/ps-ui.js' do
  Analytics.track(user_id: request.ip, event: "Hit Photoswipe ui")
  serve 'ps', 'photoswipe-ui-default.js'
end

get '/ps/skin/skin.:ext' do
  Analytics.track(
    user_id: request.ip,
    event: "Hit photoswipe skin #{params[:ext]}",
    properties: {
      ext: params[:ext]
  })
  serve 'ps/skin', "default-skin.#{params[:ext]}"
end

get '/ps/skin/preloader.gif' do
  Analytics.track(user_id: request.ip, event: "Hit photoswipe preloader")
  serve 'ps/skin', 'preloader.gif'
end

get '/bs/bs.:ext' do
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

get '/bs/theme.css' do
  Analytics.track(user_id: request.ip, event: "Hit bootstrap theme css")
  serve 'bs', 'bootstrap-theme.css'
end

get '/bs/fonts/glyphicons-halflings-regular.:ext' do
  Analytics.track(user_id: request.ip, event: "Hit bootstrap font")
  serve 'bs/fonts', "glyphicons-halflings-regular.#{params[:ext]}"
end

get '/md/md.:ext' do
  Analytics.track(
    user_id: request.ip,
    event: "Hit materialize #{params[:ext]}",
    properties: {
      ext: params[:ext]
  })
  serve 'md', "materialize.#{params[:ext]}"
end

get '/md/font/mdi/Material-Design-Icons.:ext' do
  Analytics.track(user_id: request.ip, event: "Hit materialize icons")
  serve 'md/font/mdi', "Material-Design-Icons.#{params[:ext]}"
end

get '/md/font/roboto/Roboto-:density.ttf' do
  Analytics.track(user_id: request.ip, event: "Hit materialize font")
  serve '/md/font/roboto', "Roboto-#{params[:density]}.ttf"
end
