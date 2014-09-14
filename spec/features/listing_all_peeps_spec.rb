require 'spec_helper'

feature "User views the list of peeps" do 

	before(:each) {
		Peep.create(:username => "michelle", 
								:message => "Hello world!")
	}

	scenario "when opening the home page" do 
		visit '/'
		expect(page).to have_content("Hello world!")
	end

end