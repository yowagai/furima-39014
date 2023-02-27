class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :root_item, only: [:edit, :destroy]
  before_action :root_sold, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :condition_id, :charge_id, :prefecture_id,
                                 :estimated_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def root_item
    return if @item.user == current_user
    redirect_to root_path
  end

  def root_sold
    if @item.order.present?
      redirect_to root_path
    end
  end
end
