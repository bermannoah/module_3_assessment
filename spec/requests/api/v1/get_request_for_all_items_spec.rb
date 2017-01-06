require 'rails_helper'


describe 'items endpoint' do
  context "GET /api/v1/items" do
    scenario "I receive a 200 JSON response containing all items", :vcr do
      get '/api/v1/items' 
      
      result = JSON.parse(response.body)
      
    end
  end
end
# When I send a GET request to /api/v1/items
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but NOT the created or updated at