class StoresController < ApplicationController
  def search
    redirect_to search_path(zipcode: params["/search"]["zipcode"])
  end
  
  def index
    @zipcode = params["zipcode"]
    @all_stores = Store.store_process(@zipcode)
  end  
end