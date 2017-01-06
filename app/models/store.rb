class Store < ActiveRecord::Base
  
  def self.store_process(zipcode)
    all_stores = StoreService.send_store_request(zipcode)
    binding.pry
    all_stores.map |store| do
      
    end
  end

  
  
end