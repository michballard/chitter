require 'sinatra'
require 'data_mapper'
require './lib/peep'
require './lib/user'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'super secret'

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
	@user = User.create(:email => params[:email], 
							:password => params[:password], 
							:username => params[:username], 
							:name => params[:name])
	session[:user_id] = @user.id
	redirect to('/')
end

helpers do 

	def current_user
		@current_user ||=User.get(session[:user_id]) if session[:user_id]
	end

end