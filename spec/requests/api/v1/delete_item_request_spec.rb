require 'rails_helper'

describe 'items endpoint' do
  context "GET /api/v1/items" do
    scenario "I receive a 204 JSON response" do
      store = Fabricate.times(10, :item)
    
      delete "/api/v1/items/1"

      expect(response.status).to eq(204)
    end

    xscenario "I receive the right item" do
      store = Fabricate.times(10, :item)
      item_id = store.first.id

      get "/api/v1/items/#{item_id}"
      
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item["name"]).to eq(store.first.name)
      expect(item["id"]).to eq(item_id)
    end

    xscenario "I do NOT see the created at and updated at times" do
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

# when I send a DELETE request to /api/v1/items/1'
# I receive a 204 JSON response if the record is successfully deleted