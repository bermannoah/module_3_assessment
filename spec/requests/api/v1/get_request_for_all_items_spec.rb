require 'rails_helper'

describe 'items endpoint' do
  context "GET /api/v1/items" do
    scenario "I receive a 200 JSON response" do
      store = Fabricate.times(10, :item)
      get "/api/v1/items"
      
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items).to be_an(Array)
    end

    scenario "I receive all items" do
      store = Fabricate.times(10, :item)
      get "/api/v1/items"
      
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items[0]["name"]).to eq(store.first.name)
      expect(items[9]["name"]).to eq(store.last.name)
      expect(items[9]["image_url"]).to eq(store.last.image_url)
    end

    scenario "I do NOT see the created at and updated at times" do
      store = Fabricate.times(10, :item)
      get "/api/v1/items"
      
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items[0]).to_not include("created_at")
      expect(items[9]).to_not include("created_at")
      expect(items[0]).to_not include("updated_at")
      expect(items[9]).to_not include("updated_at")
    end
  end
end
# When I send a GET request to /api/v1/items
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but NOT the created or updated at