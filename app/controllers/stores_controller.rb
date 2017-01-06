class StoresController < ApplicationController
  def search
    redirect_to search_path(zipcode: params["/search"]["zipcode"])
  end
  
  def index
    @zipcode = params["zipcode"]
    @all_stores = send_store_request(@zipcode)
  end
  
  
  private
  
  def conn
    Faraday.new(:url => "https://api.bestbuy.com") do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
  end
  
  def send_store_request(zipcode)
    response = conn.get "/v1/stores", {   :zipcode => "#{zipcode}",
                                          :format => "json", 
                                          :show => "storeId,storeType,longName,city,distance,phone,storeType,region",
                                          :apiKey => ENV['BEST_BUY_API_KEY']}
    JSON.parse(response.body)
  end
  
  
  
end