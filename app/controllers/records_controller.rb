class RecordsController < ApplicationController
  before_action :authenticate_user!, { only: [:index] }
  before_action :find_item, only: [:index, :create]

  def index
    @order = Order.new
    if @item.user_id == current_user.id
      redirect_to root_path
      nil
    elsif @item.record.present?
      redirect_to root_path
    end
  end

  def create
    @order = Order.new(record_params)
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
      render :index
    end
  end

  private

  def record_params
    params.require(:order).permit(:post_code, :prefecture, :city, :address, :building, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
