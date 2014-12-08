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
    "Access-Control-Allow-Headers" => "Origin, X-Requested-With, Content-Type, Accept"
end

get '/' do
  "<p>Summit Computer Science CDN (Content Delivery Network).</p>" +
  "<p><a href=\"http://smtcs.rocks/blog/Libraries\">List</a> of the different libraries.</p>"
end

get '/jq/1.js' do
  serve('jq', 'jquery-1.js')
end

get '/jq/2.js' do
  serve('jq', 'jquery-2.js')
end

get '/fa/fa.css' do
  serve('fa', 'fa.css')
end

get '/fa/fonts/fontawesome-webfont.:ext' do
  ext = params[:ext]
  serve('fa/fonts', "fontawesome-webfont.#{ext}")
end
