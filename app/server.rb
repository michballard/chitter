require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require './lib/peep'
require './lib/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup.rb'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash

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
	@user = User.new(:email => params[:email], 
							:password => params[:password], 
							:password_confirmation => params[:password_confirmation],
							:username => params[:username], 
							:name => params[:name])
	if @user.save
		session[:user_id] = @user.id
		redirect to('/')
	else
		flash[:notice] = "Sorry, your passwords don't match"
		erb :"users/new"
	end
end
