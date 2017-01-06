require 'rails_helper'

describe 'items endpoint' do
  context "POST /api/v1/items" do
    scenario "I receive a 201 JSON response" do
      store = Fabricate.times(10, :item)
      new_item = { name: "Super Great", description: "Seriously, this is fantastic", image_url: "https://unsplash.com/?photo=9gnXVOgo_-I"} 
      expect(Item.count).to be(10)
        
      post "/api/v1/items", new_item.to_json
      
      result = JSON.parse(response.body)

      expect(response.status).to eq(201)
      expect(Item.count).to be(11)
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
# 
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at