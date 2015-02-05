require 'sinatra'
require 'rack-timeout'
use Rack::Timeout
Rack::Timeout.timeout = 50

get '/' do
	<<"_HTML"
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
	<pre>#{Rack::Utils.escape_html(env["rack-timeout.info"])}</pre>
</body>
</html>
_HTML
end

get '/quit' do
	Sinatra::Application.quit!
end

get '/sleep' do
	sleep 40
	"Good morning"
end
