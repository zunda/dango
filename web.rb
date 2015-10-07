wait = 0
if wait > 0
	$stdout.print "Sleeping for #{wait} sec..."
	$stdout.flush
	sleep wait
	$stdout.puts " done"
	$stdout.flush
end

require 'sinatra'
require 'pp'
#require 'rack-timeout'
#use Rack::Timeout
#Rack::Timeout.timeout = 10

def dango(info = nil)
	r = <<"_HTML"
<html>
<head>
<title>dango</title>
<meta name="blitz" content="mu-2f62ff58-b164e0f3-99a23b43-922bd347">
</head>
<body style="
	background-color: #120d0a;
	color: white;
	height: 100%;
	background-image: url(http://photos-h.ak.instagram.com/hphotos-ak-xpa1/t51.2885-15/1941230_1408222796098551_1531280107_n.jpg);
	background-position: center;
	background-repeat: no-repeat;">
	<h1>Hello from Dango</h1>
_HTML
	r << "<p><pre>#{Rack::Utils.escape_html info}</pre></p>\n" if info
	r << "</body>\n</html>\n"
	return r
end

get '/' do
	dango("")
end

get '/rt' do
	dango("Rack::Timeout.service_timeout:#{Rack::Timeout.service_timeout}")
end

get '/env' do
	dango(request.env.map{|k,v| "#{k}=#{v}"}.join("\n"))
end

get '/slow' do
	sleep 10
	dango("Morning!")
end

get '/quit' do
	Sinatra::Application.quit!
end

get '/sleep' do
	sleep 40
	"Good morning"
end
