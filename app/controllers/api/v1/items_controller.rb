class Api::V1::ItemsController < Api::V1::ApiController
  
  def index
    items = Item.all
    render json: items
  end
  
  def show
    item = Item.find(params[:id])
    render json: item
  end
  
  def delete
    item = Item.find(params[:id])
    item.delete
  end
  
  def create
    item = Item.create(name: params["name"], description: params["description"], image_url: params["image_url"])
    if item.save
      
      render json: item, status: :created
    end
  end
  
end