require 'spec_helper'
require 'timecop'
require_relative 'helpers/session'

include SessionHelpers

describe "User Management" do 

	feature "user signs up" do 

		scenario "when being logged out" do 
			expect{ sign_up }.to change(User, :count).by(1)
			expect(page).to have_content("Welcome, Alice")
			expect(User.first.username).to eq("alice88")
		end

		scenario "with a password that doesn't match" do 
			expect{ sign_up('a@a.com', 'pass', 'wrong')}.to change(User, :count).by(0)
			expect(current_path).to eq('/users')
			expect(page).to have_content("Password does not match the confirmation")
		end

		scenario "with an email that is already registered" do 
			expect{ sign_up }.to change(User, :count).by(1)
			expect{ sign_up }.to change(User, :count).by(0)
			expect(page).to have_content("This email is already taken")
		end

		scenario "with a username that is already registered" do 
			expect{ sign_up }.to change(User, :count).by(1)
			expect{ sign_up_2 }.to change(User, :count).by(0)
			expect(page).to have_content("This username is already taken")
		end

	end

	feature "User signs in" do 

		before(:each) do
			User.create(:email => "test@test.com", 
									:password => "test", 
									:password_confirmation => "test", 
									:username => "testname", 
									:name => "Test")
		end

		scenario "with correct credentials" do 
			visit '/'
			expect(page).not_to have_content("Welcome, Test")
			sign_in("test@test.com", "test")
			expect(page).to have_content("Welcome, Test")
		end

		scenario "with incorrect credentials" do 
			visit '/'
			expect(page).not_to have_content("Welcome, Test")
			sign_in("test@test.com", "wrong")
			expect(page).not_to have_content("Welcome, Test")
		end

	end

	feature "User signs out" do 

		before(:each) do 
			User.create(:email => "test@test.com", 
									:password => "test", 
									:password_confirmation => "test", 
									:username => "testname", 
									:name => "Test")
		end

		scenario "While being signed in" do 
			sign_in("test@test.com", "test")
			click_button "Sign out"
			expect(page).to have_content("Good bye!")
			expect(page).not_to have_content("Welcome, Test")
		end

	end

end