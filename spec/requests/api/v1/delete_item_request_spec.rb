require 'rails_helper'

describe 'items endpoint' do
  context "GET /api/v1/items" do
    scenario "I receive a 204 JSON response" do
      store = Fabricate.times(10, :item)
    
      delete "/api/v1/items/1"

      expect(response.status).to eq(204)
    end

    scenario "I delete the right item" do
      store = Fabricate.times(10, :item)
      item_id = store.first.id
      expect(Item.count).to eq(10)

      delete "/api/v1/items/#{item_id}"
      
      expect(response.status).to eq(204)
      expect(Item.count).to eq(9)
    end
  end
end