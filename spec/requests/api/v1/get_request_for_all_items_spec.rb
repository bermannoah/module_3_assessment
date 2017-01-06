require 'rails_helper'

describe 'items endpoint' do
  context "GET /api/v1/items" do
    scenario "I receive a 200 JSON response" do
      store = Fabricate.times(10, :item)
      get "/api/v1/items"
      
      items = JSON.parse(response.body)
      
      expect(response).to be_success

    end
  end
end
# When I send a GET request to /api/v1/items
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but NOT the created or updated at