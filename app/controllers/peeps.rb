get '/peeps/new' do 
	  erb :"peeps/new"
end

post '/peeps' do 
	message = params["message"]
	time = Time.now
	username = current_user.username
	name = current_user.name
	Peep.create(:message => message, 
							:time_created => time,
							:username => username, 
							:name => name)
	redirect to('/')
end