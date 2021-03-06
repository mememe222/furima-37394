class ItemsController < ApplicationController
  before_action :authenticate_user!, { only: [:new, :edit] }
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
    if @item.user_id != current_user.id
      redirect_to root_path
      nil
    elsif @item.record.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      item.destroy
      redirect_to root_path
    else
      redirect_to action: index
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :explanation, :category_id, :condition_id, :shipment_source_id,
                                 :days_id, :charge_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
