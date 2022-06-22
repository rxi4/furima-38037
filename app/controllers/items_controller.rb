class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] #:edit, :update, :destroy
  #before_action :set_item, only: [:edit, :show, :update, :destroy]
  
  def index
    #@items = Item.all.order('created_at DESC')
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
    params.require(:item).permit(:name, :price, :description, :category_id, :item_status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end

  #def set_item
    #@item = Item.find(params[:id])
  #end

end
