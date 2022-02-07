class ItemsController < ApplicationController
  before_action :authenticate_user!, { only: [:new] }

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :explanation, :category_id, :condition_id, :shipment_source_id,
                                 :shipping_days_id, :delivery_charge_id, :price, :user_id).merge(user_id: current_user.id)
  end
end
