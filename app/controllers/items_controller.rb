class ItemsController < ApplicationController
  before_action :authenticate_user!, { only: [:new] }

  def index
    @items = Item.all.order('created_at DESC')
    @records = Record.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :explanation, :category_id, :condition_id, :shipment_source_id,
                                 :shipping_days_id, :charge_id, :price).merge(user_id: current_user.id)
  end
end
