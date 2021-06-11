class ShoppingsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_show,only: [:index]

  def index
    @shopping_address = ShoppingAddress.new
    @item = Item.find(params[:item_id])
  end


  def create
    @shopping_address = ShoppingAddress.new(shopping_params)
    @item = Item.find(params[:item_id])
    if @shopping_address.valid? 
       pay_item
       @shopping_address.save
       return redirect_to root_path
    else
      render :index
    end
  end

  private

  def shopping_params
    params.require(:shopping_address).permit(:postal_code,:prefecture_id,:municipality,:address,:building_name,:phone_number).merge(user_id: current_user.id,item_id:params[:item_id],token: params[:token])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,
        card: shopping_params[:token],
        currency: 'jpy'
      )
   end
 

  def move_to_show
    @item = Item.find(params[:item_id])
     if current_user.id == @item.user_id || @item.shopping.present?
      redirect_to items_path
     end
  end


end
