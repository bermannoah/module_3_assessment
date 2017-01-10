class StoresController < ApplicationController
  def search
    @zipcode = params["zipcode"]
    @all_stores = Store.store_process(@zipcode)
  end
end