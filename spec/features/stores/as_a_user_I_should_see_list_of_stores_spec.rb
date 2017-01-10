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
    
    scenario "after searching I should see 15 stores within 25 miles of 80202", :vcr do
      visit "/"
      
      fill_in "zipcode", with: 80202
      click_on "Search for nearest store"
      
      expect(current_path).to include("/search")
      expect(page).to have_content("15 Total Stores")
    end
    
    scenario "after searching I should see the store data I need", :vcr do
      visit "/"
      
      fill_in "zipcode", with: 80202
      click_on "Search for nearest store"
      
      expect(current_path).to include("/search")

      expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
      expect(page).to have_content("Best Buy - Belmar")
      expect(page).to have_content("Lakewood")
      expect(page).to have_content(5.28)
      expect(page).to have_content("303-742-8039")
      expect(page).to have_content("BigBox")
      expect(page).to have_content("Best Buy - Parker")
      expect(page).to have_content(20.85)
      expect(page).to have_content("Mobile")
    end
  end
end