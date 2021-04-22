class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:text,:category_id,:condition_id,:delivery_charge_id,:prefecture_id,:days_to_ship_id,:price).merge(:user_id: current_user.id)
  end

end
