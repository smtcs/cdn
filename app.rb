require 'sinatra'

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
    "Access-Control-Allow-Headers" => "Origin, X-Requested-With, Content-Type, Accept",
    "Cache-Control" => "public; max-age=604800"
end

get '/' do
  "<p>Summit Computer Science CDN (Content Delivery Network).</p>" +
  "<p><a href=\"http://smtcs.rocks/blog/Libraries\">List</a> of the different libraries.</p>"
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
