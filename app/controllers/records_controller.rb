class RecordsController < ApplicationController
  before_action :authenticate_user!, { only: [:index] }

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = Order.new(record_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: record_params[:token],
        currency: 'jpy'
      )
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def record_params
    params.require(:order).permit(:post_code, :prefecture, :city, :address, :building, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end
end
