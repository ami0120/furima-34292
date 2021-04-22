class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ ,message: 'Half-width number'}
  validates :price ,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 ,message: 'Out of setting range' }
end
