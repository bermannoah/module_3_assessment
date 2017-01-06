class Api::V1::ItemsController < Api::V1::ApiController
  
  def index
    items = Item.all
    render json: items
  end
  
  def show
    item = Item.find(params[:id])
    render json: item
  end
  
end