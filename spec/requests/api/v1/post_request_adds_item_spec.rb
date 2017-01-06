require 'rails_helper'

describe 'items endpoint' do
  context "POST /api/v1/items" do
    scenario "I receive a 201 JSON response" do
      store = Fabricate.times(10, :item)
      new_item = { name: "Super Great", description: "Seriously, this is fantastic", image_url: "http://www.example.com/great_image.jpg"} 
      expect(Item.count).to be(10)
        
      post "/api/v1/items", params: new_item.to_json, headers: { 'CONTENT_TYPE' => 'application/json'}
      
      result = JSON.parse(response.body)

      expect(response.status).to eq(201)
      expect(Item.count).to be(11)
    end

    scenario "I receive the right item" do
      store = Fabricate.times(10, :item)
      new_item = { name: "Really good", description: "Whooaaaaaaa", image_url: "http://www.example.com/even_better_image.jpg"} 
      expect(Item.count).to be(10)
        
      post "/api/v1/items", params: new_item.to_json, headers: { 'CONTENT_TYPE' => 'application/json'}
      
      result = JSON.parse(response.body)

      expect(response.status).to eq(201)
      expect(Item.count).to be(11)
      expect(result["name"]).to eq("Really good")
      expect(result["description"]).to eq("Whooaaaaaaa")
    end

    scenario "I do NOT see the created at and updated at times" do
      store = Fabricate.times(10, :item)
      new_item = { name: "The most good", description: "Plato", image_url: "http://www.example.com/oh_no.jpg"} 
      expect(Item.count).to be(10)
        
      post "/api/v1/items", params: new_item.to_json, headers: { 'CONTENT_TYPE' => 'application/json'}
      
      result = JSON.parse(response.body)

      expect(response.status).to eq(201)
      expect(Item.count).to be(11)
      expect(result["name"]).to eq("The most good")
      expect(result["description"]).to eq("Plato")
      expect(result).to_not include("created_at")
      expect(result).to_not include("updated_at")
    end
  end
end
