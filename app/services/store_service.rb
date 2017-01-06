module StoreService
  
  def self.conn
    Faraday.new(:url => "https://api.bestbuy.com") do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
  end
  
  def self.send_store_request(zipcode)
    response = conn.get "/v1/stores", {   :zipcode => "#{zipcode}",
                                          :area => 25,
                                          :format => "json", 
                                          :show => "storeId,storeType,longName,city,distance,phone,storeType,region",
                                          :apiKey => ENV['BEST_BUY_API_KEY']}
    JSON.parse(response.body)
  end

end