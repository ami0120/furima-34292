class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :item_find,only: [:show,:edit,:update,:destroy]
  before_action :move_to_index,only: [:edit,:update,:destroy]

  
  def index
    @item = Item.all.order("created_at DESC")
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
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
      if @item.destroy
      redirect_to root_path
      end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user.id != @item.user_id || @item.shopping.present?
     redirect_to root_path
    end
  end

  def item_find
    @item = Item.find(params[:id])
  end
  

end