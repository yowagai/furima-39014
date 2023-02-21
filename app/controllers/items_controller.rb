class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @items = Item.create(item_params)
  end

private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :condition_id, :charge_id, :prefecture_id, :estimated_id, :image).merge(user_id: current_user.id)
  end



end
