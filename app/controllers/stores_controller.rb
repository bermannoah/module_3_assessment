class StoresController < ApplicationController
  def search
    binding.pry
    zipcode = params["zipcode"]
    @all_stores = Store.store_process(zipcode)
  end
end