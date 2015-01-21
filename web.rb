# vim: ts=3 sw=3:
require 'sinatra'

get '/' do
	"Hello, this is daigo-dango"
end

get '/quit' do
	Sinatra::Application.quit!
end

