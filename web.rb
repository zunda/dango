require 'sinatra'

get '/' do
	"Hello from dango (test branch)"
end

get '/quit' do
	Sinatra::Application.quit!
end

get '/sleep' do
	sleep 40
	"Good morning"
end
