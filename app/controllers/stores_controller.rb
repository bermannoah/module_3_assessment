class StoresController < ApplicationController
  def search
    redirect_to "/search"
  end
  
  def index
    
  end
  
  
  private
  
  self.conn
    Faraday.new(:url => "https://api.bestbuy.com") do |faraday|
      faraday.request :url_encoded
      faraay.adapter Faraday.default_adapter
    end
  end
  
  def self.send_store_request(zipcode)
    response = conn.get "/v1/stores(area('#{zipcode}', 25))", { :format => "json", 
                                                                :show => "storeId,storeType,longName,city,distance,phone,storeType,region",
                                                                :apiKey => ENV['BEST_BUY_API_KEY']}
  end
  
  
  
end