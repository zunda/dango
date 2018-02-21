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

require 'mail'
Mail.defaults do
  delivery_method :smtp, {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :user_name => ENV['SENDGRID_USERNAME'],
    :password => ENV['SENDGRID_PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end

def redacted(str)
	res = str.dup
	{
		%r|(PASSWORD=).*|i => '\1(redacted)',
		%r|//.*:.*@| => '//(redacted):(redacted)@',
	}.each_pair do |r, s|
		res.gsub!(r, s)
	end
	return res
end

def dango(info = nil)
	r = <<"_HTML"
<html>
<head>
<title>dango on pr</title>
</head>
<body style="
	background-color: #120d0a;
	color: white;
	height: 100%;
	background-image: url(zunda.jpg);
	background-position: center;
	background-repeat: no-repeat;">
	<h1>Hello from Dango</h1>
_HTML
	r << "<p><pre>#{Rack::Utils.escape_html info}</pre></p>\n" if info
	r << "</body>\n</html>\n"
	return r
end

get '/' do
	headers 'X-Test' => 'Hello World'
	dango("")
end

post '/' do
  $stderr.puts "parames:"
  $stderr.puts params.inspect
	dango("")
end

get '/rt' do
	dango("Rack::Timeout.service_timeout:#{Rack::Timeout.service_timeout}")
end

get '/env' do
	dango(request.env.map{|k,v| "#{k}=#{v}"}.join("\n"))
end

get '/printenv' do
	dango(redacted(`printenv`))
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

get '/zunda.jpg' do
	send_file File.join(settings.public_folder, 'zunda.jpg')
end

get '/mail' do
  Mail.deliver do
    to 'zundan@gmail.com'
    from 'daigo@heroku.com'
    subject 'testing send mail'
    body 'Sending email with Ruby through SendGrid!'
  end
	dango("Sent!")
end
