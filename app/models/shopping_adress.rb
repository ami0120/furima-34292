class ShoppingAdress
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:municipality,:address,:building_name,:phone_number,:user_id,:item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/,message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id, numericality:{ other_than: 1 }
    validates :address
    validates :phone_number,numericality: format: {with: /^(0{1}\d{10})$/}
    validates :user_id
    validates :item_id
  end

  def save
    shopping = Shopping.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code,prefecture_id: prefecture_id,municipality: municipality,address: address,building_name: building_name,phone_number: phone_number,shopping_id: shopping.id)
  end
  
  end