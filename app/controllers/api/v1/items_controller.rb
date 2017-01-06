class Api::V1::ItemsController < Api::V1::ApiController
  
  def index
    @items = Item.all
    render json: @items
  end
  
end