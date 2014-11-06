get '/peeps/new' do
  if current_user
	  erb :"peeps/new"
	else
    redirect to "/"
	end
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