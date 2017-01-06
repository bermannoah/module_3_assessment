class Store < ActiveRecord::Base
  
  def self.store_process(zipcode)
    all_stores = StoreService.send_store_request(zipcode)
    all_stores["stores"].map do |store|
      Store.create(long_name: store["longName"],
                   city: store["city"],
                   distance: store["distance"],
                   phone_number: store["phone"],
                   store_type: store["storeType"],
                   search_zip: zipcode)
    end
  end
    
end