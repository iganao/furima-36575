class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @shopping_address_buy = ShoppingAddressBuy.new
  end

  def create
    @item = Item.find(params[:item_id])
    @shopping_address_buy = ShoppingAddressBuy.new(shopping_params)
    if @shopping_address_buy.valid?
      pay_item
      @shopping_address_buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def shopping_params
    params.require(:shopping_address_buy).permit(:postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @item.price,
          card: shopping_params[:token],
          currency: 'jpy'
      )
  end
end
