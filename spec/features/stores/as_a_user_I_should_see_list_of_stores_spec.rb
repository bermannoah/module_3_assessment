require 'rails_helper'

describe "list of Best Buy stores" do
  context "as a user I" do
    scenario "see a search box at root" do
      visit "/"
      
      expect(page).to have_css("#zipcode")
    end

    scenario "enter text in the search box and go to the right path", :vcr do
      visit "/"
      
      fill_in "zipcode", with: 80202
      click_on "Search for nearest store"
      
      expect(current_path).to include("/search")
    end

    scenario "after searching I should see stores within 25 miles of 80202", :vcr do
      visit "/"
      
      fill_in "zipcode", with: 80202
      click_on "Search for nearest store"
      
      expect(current_path).to include("/search")
      expect(page).to have_content("Stores within 25 miles of 80202")
    end
    
    scenario "after searching I should see stores within 25 miles of 80202", :vcr do
      visit "/"
      
      fill_in "zipcode", with: 80202
      click_on "Search for nearest store"
      
      expect(current_path).to include("/search")
      expect(page).to have_content("10 Total Stores")
    end

    scenario "after searching I should see exactly the right number of stores", :vcr do
      visit "/"
      
      fill_in "zipcode", with: 80202
      click_on "Search for nearest store"
      
      expect(current_path).to include("/search")
      expect(Store.count).to eq(10)
    end
    
    scenario "after searching I should exactly the store data", :vcr do
      visit "/"
      
      fill_in "zipcode", with: 80202
      click_on "Search for nearest store"
      
      expect(current_path).to include("/search")
      expect(page).to have_content(Store.first.long_name)
      expect(page).to have_content(Store.first.city)
      expect(page).to have_content(Store.first.distance)
      expect(page).to have_content(Store.first.phone_number)
      expect(page).to have_content(Store.first.store_type)
      expect(page).to have_content(Store.last.long_name)
      expect(page).to have_content(Store.last.city)
      expect(page).to have_content(Store.last.distance)
      expect(page).to have_content(Store.last.phone_number)
      expect(page).to have_content(Store.last.store_type)
    end
  end
end