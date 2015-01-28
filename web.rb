require 'sinatra'

get '/' do
	"Hello from dango"
end

get '/quit' do
	Sinatra::Application.quit!
end

get '/sleep' do
	sleep 40
	"Good morning"
end
