require 'sinatra'
require 'rack-timeout'
use Rack::Timeout

get '/' do
	puts "Rack::Timeout.timeout: #{Rack::Timeout.timeout}"
	<<_HTML
<html>
<head>
<title>dango</title>
</head>
<body style="
	background-color: #120d0a;
	color: white;
	height: 100%;
	background-image: url(http://photos-h.ak.instagram.com/hphotos-ak-xpa1/t51.2885-15/1941230_1408222796098551_1531280107_n.jpg);
	background-position: center;
	background-repeat: no-repeat;">
	<h1>Hello from Dango</h1>
</body>
</html>
_HTML
end

get '/quit' do
	puts "Rack::Timeout.timeout: #{Rack::Timeout.timeout}"
	Sinatra::Application.quit!
end

get '/sleep' do
	Rack::Timeout.timeout = 60
	puts "Rack::Timeout.timeout: #{Rack::Timeout.timeout}"
	sleep 40
	"Good morning"
end

get '/timeout' do
	Rack::Timeout.timeout = 5
	puts "Rack::Timeout.timeout: #{Rack::Timeout.timeout}"
	sleep 40
	"Good morning"
end
