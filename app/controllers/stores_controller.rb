class StoresController < ApplicationController
  
  def index
    @zipcode = params["zipcode"]
    @all_stores = Store.store_process(@zipcode)
  end

end