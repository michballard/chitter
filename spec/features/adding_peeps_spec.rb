require 'spec_helper'

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

		# add that user cannot add peep when not signed in
		# user cannot see peep form when not signed in, only peeps

		def add_peep(message)
			within('#new-peep') do 
				fill_in 'message', :with => message
				click_button 'Add peep'
			end
		end

	end 

end