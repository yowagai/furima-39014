class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    Address.create(address_params)
    if @order.valid?
      @order.save
      return redirect_to item_path(@order.item)
    else
      @item = @order.item
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:price).marge(user_id: current_user)
  end

  def address_params
    params.permit(:post_code, :prefecture_id, :city, :address, :apartment, :phone_number).merge(order_id: @order.id, user_id: current_user.id))
  end

end
