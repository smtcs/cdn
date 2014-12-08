require 'sinatra'

helpers do
  def serve(abbr, filename, type)
    headers "Content-Type" => type.to_s
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

get '/fa/fa.css' do
  serve('fa', 'fa.css', 'text/css')
end
