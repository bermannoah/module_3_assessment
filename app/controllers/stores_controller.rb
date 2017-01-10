class StoresController < ApplicationController
  def search
    zipcode = params["/search"]["zipcode"]
    @all_stores = Store.store_process(zipcode)
  end
end