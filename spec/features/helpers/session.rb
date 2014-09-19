module SessionHelpers

	def sign_up(email = "alice@example.com", 
							password = "oranges!",
							password_confirmation = "oranges!",
							username = "alice88", 
							name = "Alice")
		visit '/users/new'
		expect(page.status_code).to eq(200)
		fill_in :email, :with => email
		fill_in :password, :with => password
		fill_in :password_confirmation, :with => password_confirmation
		fill_in :username, :with => username
		fill_in :name, :with => name
		click_button("Sign up")
	end

	def sign_up_2(email = "alice88@example.com", 
							password = "oranges!",
							password_confirmation = "oranges!",
							username = "alice88", 
							name = "Alice")
		visit '/users/new'
		expect(page.status_code).to eq(200)
		fill_in :email, :with => email
		fill_in :password, :with => password
		fill_in :password_confirmation, :with => password_confirmation
		fill_in :username, :with => username
		fill_in :name, :with => name
		click_button("Sign up")
	end

	def sign_in(email, password)
		visit '/sessions/new'
		fill_in 'email', :with => email
		fill_in 'password', :with => password
		click_button 'Sign in'
	end

end