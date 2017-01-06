require 'rails_helper'

describe "list of Best Buy stores" do
  context "as a user I" do
    scenario "see a search box at root" do
      visit "/"
      
      expect(page).to have_css("#_zipcode")
    end

    scenario "enter text in the search box and go to the right path" do
      visit "/"
      
      fill_in "_zipcode", with: 80202
      click_on "Search for nearest store"
      
      expect(current_path).to include("/search")
    end
  end
end

  # As a user
  # When I visit "/"
  # And I fill in a search box with "80202" and click "search"
  # Then my current path should be "/search" (ignoring params)
  # And I should see stores within 25 miles of 80202
  # And I should see a message that says "16 Total Stores"
  # And I should see exactly 15 results
  # And I should see the long name, city, distance, phone number and store type for each of the 15 results
