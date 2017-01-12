class Store
  attr_reader :long_name, :city, :distance, :phone_number, :store_type
  
  def initialize(raw_store)
    @long_name = raw_store["longName"]
    @city = raw_store["city"]
    @distance = raw_store["distance"]
    @phone_number = raw_store["phone"]
    @store_type = raw_store["storeType"]
  end
  
  def self.store_process(zipcode)
    all_stores = StoreService.send_store_request(zipcode)
    stores = []
    all_stores.each do |store|
      stores << Store.new(store)
    end
    stores
  end
    
end