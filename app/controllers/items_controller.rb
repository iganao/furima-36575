class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
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
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :price, :description, :category_id, :condition_id, :postage_id, :region_id,
                                 :shopping_date_id, :image, :user_id).merge(user_id: current_user.id)
  end
end
