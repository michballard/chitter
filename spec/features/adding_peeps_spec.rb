require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

describe "Adding Peeps" do 

	feature "User adds a peep" do 

		scenario "when browsing the homepage" do 
			expect(Peep.count).to eq(0)
			visit '/'
			add_peep("Hello world!")
			expect(Peep.count).to eq(1)
			peep = Peep.first
			expect(peep.message).to eq("Hello world!")
		end

		def add_peep(message)
			User.create(:email => "test@test.com", 
									:password => "test", 
									:password_confirmation => "test", 
									:username => "testname", 
									:name => "Test")
			sign_in("test@test.com", "test")
			visit '/peeps/new'
			within('#new-peep') do 
				fill_in 'message', :with => message
				click_button 'Add peep'
			end
		end
	end 
end