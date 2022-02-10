class OrdersController < ApplicationController
  def index
  end

  def create
    @order = Order.new
    redirect_to root_path
  end
end
