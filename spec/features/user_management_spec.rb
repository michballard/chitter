require 'spec_helper'

describe "User Management" do 

	feature "user signs up" do 

		scenario "when being logged out" do 
			expect{sign_up}.to change(User, :count).by(1)
			expect(User.first.email).to eq("alice@example.com")
		end

		def sign_up(email = "alice@example.com", 
								password = "oranges!",
								name = "Alice Allens", 
								username = "alice88")
			visit '/users/new'
			# expect(page.status_code).to eq(200)
			fill_in :email, :with => email
			fill_in :password, :with => password
			fill_in :username, :with => username
			fill_in :name, :with => name
			click_button "Sign up"
		end

	end

end 


# Sign up (users)
#      - register page
# Log in (sessions)
#      - log in page
# Log out (sessions)
#      - log out page