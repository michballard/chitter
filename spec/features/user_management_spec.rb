require 'spec_helper'

describe "User Management" do 

	feature "user signs up" do 

		scenario "when being logged out" do 
			expect{sign_up}.to change(User, :count).by(1)
			expect(page).to have_content("Welcome, Alice")
			expect(User.first.username).to eq("alice88")
		end

		scenario "with a password that doesn't match" do 
			expect{sign_up('a@a.com', 'pass', 'wrong')}.to change(User, :count).by(0)
			expect(current_path).to eq('/users')
			expect(page).to have_content("Sorry, your passwords don't match")
		end

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

	end

end