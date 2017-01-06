require 'rails_helper'

describe 'items endpoint' do
  context "GET /api/v1/items" do
    scenario "I receive a 200 JSON response" do
      store = Fabricate.times(10, :item)
    
      get "/api/v1/items/1"
      
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item).to be_a(Hash)
    end

    scenario "I receive the right item" do
      store = Fabricate.times(10, :item)
      item_id = store.first.id

      get "/api/v1/items/#{item_id}"
      
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item["name"]).to eq(store.first.name)
      expect(item["id"]).to eq(item_id)
    end

    scenario "I do NOT see the created at and updated at times" do
      store = Fabricate.times(10, :item)
      item_id = store.first.id

      get "/api/v1/items/#{item_id}"
      
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item).to_not include("created_at")
      expect(item).to_not include("updated_at")
    end
  end
end

# when I send a GET request to /api/v1/items/1'
# I get just one item (that item) back with rel info