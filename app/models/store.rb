class Store
  def initialize(raw_store)
    @long_name = raw_store["longName"]
    @city = raw_store["city"]
    @distance = raw_store["distance"]
    @phone_number = raw_store["phone"]
    @store_type = raw_store["storeType"]
  end
  
  def self.store_process(zipcode)
    all_stores = StoreService.send_store_request(zipcode)
    all_stores.each do |store|
      Store.new(store)
    end
  end
    
end