require 'rails_helper'

describe "list of Best Buy stores" do
  context "as a user I" do
    scenario "see a search box at root" do
      visit "/"
      
      expect(page).to have_css("#_search_zipcode")
    end

    scenario "enter text in the search box and go to the right path" do
      visit "/"
      
      fill_in "_search_zipcode", with: 80202
      click_on "Search for nearest store"
      
      expect(current_path).to include("/search")
    end

    scenario "after searching I should see stores within 25 miles of 80202" do
      visit "/"
      
      fill_in "_search_zipcode", with: 80202
      click_on "Search for nearest store"
      
      expect(current_path).to include("/search")
      expect(page).to have_content("Stores within 25 miles of 80202")
    end
  end
end

  # And I should see stores within 25 miles of 80202
  # And I should see a message that says "16 Total Stores"
  # And I should see exactly 15 results
  # And I should see the long name, city, distance, phone number and store type for each of the 15 results
