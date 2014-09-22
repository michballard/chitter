post '/peeps' do 
	message = params["message"]
	time = Time.now
	username = current_user.username
	Peep.create(:message => message, 
							:time_created => time,
							:username => username)
	redirect to('/')
end