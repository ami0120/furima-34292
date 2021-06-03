class ShoppingsController < ApplicationController

  def index
    @shopping_address = ShoppingAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @shopping_address = ShoppingAddress.new(shopping_params)
  end

  private

  def shopping_params
    params.require(:shopping_address).permit(:postal_code,:prefecture_id,:municipality,:address,:building_name,:phone_number).merge(user_id: current_user.id,item_id:params[:item_id])
  end


end
