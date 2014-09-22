require 'spec_helper'

describe "Listing All Peeps" do 

	feature "User views the list of peeps" do 

		before(:each) {
			Peep.create(:username => "tester", 
									:message => "Hello world,", 
									:time_created => Timecop.freeze(Time.local(2014, 9, 10, 12, 00, 0)))
			Peep.create(:username => "tester", 
									:message => "How are you?", 
									:time_created => Timecop.freeze(Time.local(2014, 9, 10, 12, 15, 0)))
		}

		scenario "when opening the home page" do 
			visit '/'
			expect(page).to have_content("Hello world,")
			expect(page).to have_content("How are you?")
			expect(page).to have_content("tester")
			expect(page).to have_content("tester")
		end

	end

end 