require 'sinatra'

get '/' do
	"Hello from dango from GitHub"
end

get '/quit' do
	Sinatra::Application.quit!
end

