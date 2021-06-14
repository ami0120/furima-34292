class AddShoppingIdToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :shopping, foreign_key: true
  end
end
