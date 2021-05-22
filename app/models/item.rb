class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

with_options presence: true do
  validates :image
  validates :name
  validates :text
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id,  numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true, message: "Half-width number" }
end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is Out of setting range" }

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship
  
end