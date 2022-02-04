class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    if Item.create(item_params)
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :image, :explanation, :category_id, :condition_id, :shipment_source_id, :shipping_days_id, :delivery_charge_id, :price, :user_id ).merge(user_id: current_user.id)
  end
end
