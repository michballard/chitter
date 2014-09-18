require 'sinatra'
require 'data_mapper'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/peep'
require './lib/user'

DataMapper.finalize

DataMapper.auto_upgrade!

get '/' do 
	@peeps = Peep.all
	erb :index
end

post '/peeps' do 
	message = params["message"]
	Peep.create(:message => message)
	redirect to('/')
end

get '/users/new' do 
	@user = User.new
	erb :"users/new"
end

post '/users' do 
	User.create(:email => params[:email], 
							:password => params[:password], 
							:username => params[:username], 
							:name => params[:name])
	redirect to('/')
end